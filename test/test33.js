let id = "test01#";
let sign = "!@#$%^&*";

let id2 = "test02"
// 테스트용으로 만든 pw
let pw = "testtest3#3";

// 아이디 유효성 검사
function isValidId(id, sign) {
    for (let i = 0; i < id.length; i++) {
        for (let j = 0; j < sign.length; j++) {
            if (id[i] === sign[j]) {
                return true;
            }
        }
    }
    return false;
}

// 암호 유효성 검사
function isValidPassword(password, sign) {
    if (password.length < 8) {
        return false;
    }
    for (let i = 0; i < password.length; i++) {
        for (let j = 0; j < sign.length; j++) {
            if (password[i] === sign[j]) {
                return true;
            }
        }
    }
    return false;
}

// 유효성 검사 결과 출력
console.log((isValidId(id, sign) && isValidPassword(pw, sign)) ? "사용 가능" : "불가능");
console.log((isValidId(id2, sign) && isValidPassword(pw, sign)) ? "사용 가능" : "불가능");