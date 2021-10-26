// Deploy smart contract to network
const main = async () => {
    // hre is Hardhat Runtime Env, passed in with `npx hardhat` command
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory('WavePortal');
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed(); // wait for contract to be deployed
    console.log(`Deployed to ${waveContract.address}, by ${owner.address}`);


    // Running as owner.
    let waveCount;
    waveCount = await waveContract.getTotalWaves();

    let waveTxn = await waveContract.wave(); // Invoke wave function.
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();

    // Running as other person.
    waveTxn = await waveContract.connect(randomPerson).wave();
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
}

runMain();