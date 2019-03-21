const { getType, toModelClassName, createMapModel, createListModel, createListState, createMapState } = require('./util');
const fs = require('fs');
const path = require('path');
const name = process.argv[2];
const suffix = 'JsonModel';
let json;

try {
    json = require('../../assets/mock/' + name + '.json');
}
catch(e) {
    json = require('./data.json');
}

// 递归创建元素
function forCreactor(pChildren, data) {
    for(let k in data) {
        let val = data[k];
        let type = getType(val);
        let subData = {
            type: type,
            name: k
        };

        if(type === 'List' && val.length) {
            const subType = getType(val[0]);
        
            if(subType !== 'Map') {
                subData.type += `<${subType}>`;
            }
            else {
                subData.children = [{
                    type: subType,
                    name: '0',
                    className: toModelClassName(k + suffix),
                    children: []
                }];

                forCreactor(subData.children[0].children, val[0]);
                subData.className = toModelClassName(k + 'List' + suffix);
                subData.type += `<${toModelClassName(k + suffix)}>`;
            }
        } else if (type === 'Map') {
            subData.children = [];
            subData.className = toModelClassName(k + suffix);
            forCreactor(subData.children, val);
        }

        pChildren.push(subData);
    }
}

function forOutput(node) {
    if(!node.children || !node.children.length) {
        return '';
    }

    let result = '';
    node.children.forEach(child => {
        if(child.className) {
            result += child.type.indexOf('Map') !== -1 ? createMapState(child) : createListState(child);
            result += forOutput(child);
        }
    });
    
    return result;
}

function main () {
    const children = [];
    forCreactor(children, {
        [name]: json
    });

    let result = forOutput({children});

    // fs.writeFileSync(path.join(__dirname, `../../lib/models/${name}.json.dart`), result);
    fs.writeFileSync(path.join(__dirname, '../../output.json.dart'), result);
    console.log(JSON.stringify(children[0], null ,4));
}

let root;
main();
