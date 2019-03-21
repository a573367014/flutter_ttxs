const _ = require('lodash');
const plus = require('node-plus-string');

// 转驼峰并首字母大写
function toModelClassName(name) {
    return plus.capitalize(
        plus.camelize(name)
    );
}

// 类型判断
function getType(val) {
    if(_.isString(val)) {
        return 'String';
    }

    if(_.isNumber(val)) {
        return val.toString().indexOf('.') > -1 ? 'double' : 'int';
    }

    if(_.isArray(val)) {
        return 'List';
    }

    if(_.isObject(val)) {
        return 'Map';
    }

    throw new Error(`未识别的类型: ${key ? (key + ": ") : ''}value`);
}

function createMapModel(node) {
    return `
    \nclass ${node.className} {
        ${node.children.map(child => `${child.className || child.type} ${plus.camelize(child.name)};`)
            .toString()
            .replace(/,/g, '\n')}

        ${node.className}({
            ${node.children.map(child => `this.${plus.camelize(child.name)}`)}
        });

        factory ${node.className}.fromJson(Map<String, dynamic> json) {
            return ${node.className}(
                ${node.children.map(child => `${plus.camelize(child.name)}: ${
                    child.className ?
                        `${child.className}.fromJson(json['${child.name}'])`:
                        `json['${child.name}']`
                }`)}
            );
        }

        Map<String, dynamic> toJson() => {
            ${node.children.map(child => `'${child.name}': ${
                child.className ? (plus.camelize(child.name) + '.toJson()'
            ) : plus.camelize(child.name)}`)}
        };
    }`
}

function createListModel(node) {
    const child = node.children[0];
    const childClassName = child.className || child.type;

    return `
    \nclass ${node.className} {
        final List<${childClassName}> list;
        ${node.className}(this.list);

        factory ${node.className}.fromJson(List<dynamic> parsedJson) {
            List<${childClassName}> _list = List<${childClassName}>();
            _list = parsedJson.map((json) => ${childClassName}.fromJson(json)).toList();
            return ${node.className}(_list);
        }

        List<dynamic> toJson() => list.map((item) => item.toJson()).toList();
    }`;
}

function createMapState(node) {
    return `
    \nclass ${node.className} implements Cloneable<${node.className}> {
        ${node.children.map(child => `${child.className || child.type} ${plus.camelize(child.name)};`)
            .toString()
            .replace(/,/g, '\n')}

        ${node.className}({
            ${node.children.map(child => `this.${plus.camelize(child.name)}`)}
        });

        factory ${node.className}.fromJson(Map<String, dynamic> json) {
            return ${node.className}(
                ${node.children.map(child => `${plus.camelize(child.name)}: ${
                    child.className ?
                        `${child.className}.fromJson(json['${child.name}'])`:
                        `json['${child.name}']`
                }`)}
            );
        }

        Map<String, dynamic> toJson() => {
            ${node.children.map(child => `'${child.name}': ${
                child.className ? (plus.camelize(child.name) + '.toJson()'
            ) : plus.camelize(child.name)}`)}
        };

        @override
        ${node.className} clone() {
          return ${node.className}()
            ${node.children.map(
                child => `..${plus.camelize(child.name)} = ${plus.camelize(child.name)}\n`
            ).toString()
            .replace(/,/g, '\n')};
        }
    }`.replace(/JsonModel/g, 'State');
}

function createListState(node) {
    const child = node.children[0];
    const childClassName = child.className || child.type;

    return `
    \nclass ${node.className} implements Cloneable<${node.className}> {
        final List<${childClassName}> list;
        ${node.className}(this.list);

        factory ${node.className}.fromJson(List<dynamic> parsedJson) {
            List<${childClassName}> _list = List<${childClassName}>();
            _list = parsedJson.map((json) => ${childClassName}.fromJson(json)).toList();
            return ${node.className}(_list);
        }

        List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

        @override
        ${node.className} clone() {
          return ${node.className}(list);
        }
    }`.replace(/JsonModel/g, 'State');
}
module.exports = {
    getType,
    toModelClassName,
    createMapModel,
    createListModel,
    createMapState,
    createListState
}