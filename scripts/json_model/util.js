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
        return 'double';
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
        ${node.children.map(child => `${child.className || child.type} ${child.name};`)
            .toString()
            .replace(/,/g, '\n')}

        ${node.className}({
            ${node.children.map(child => `this.${child.name}`)}
        });

        factory ${node.className}.fromJson(Map<String, dynamic> json) {
            return ${node.className}(
                ${node.children.map(child => `${child.name}: ${
                    child.className ?
                        `${child.className}.fromJson(json['${child.name}'])`:
                        `json['${child.name}']`
                }`)}
            );
        }

        Map<String, dynamic> toJson() => {
            ${node.children.map(child => `'${child.name}': ${
                child.className ? (child.name + '.toJson()'
            ) : child.name}`)}
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

        factory ${node.className}.fromJson(List<${child.type}> list) {
            List<${childClassName}> newItems = list.map((json) => ${childClassName}.fromJson(json)).toList();
            return ${node.className}(newItems);
        }
      
        List<Map> toJson() => list.map((item) => item.toJson()).toList();
    }`;
}
module.exports = {
    getType,
    toModelClassName,
    createMapModel,
    createListModel
}