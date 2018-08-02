# INSAction
参考Masonry的接口，封装SCNAction


```

[planeNode makeSequenceAction:^(INSActionMaker *maker) {
    [maker sequenceAction:^(INSActionMaker *maker) {
        [maker groupAction:^(INSActionMaker *maker) {
            maker.action.scaleTo(6).duration(2.0);
            maker.action.moveTo(SCNVector3Make(0, 2.0, 0)).duration(2.0);
        }];
        maker.action.wait().duration(2.0);
        [maker groupAction:^(INSActionMaker *afterWaitMaker) {
            afterWaitMaker.action.moveTo(SCNVector3Make(0,2.5, 0)).duration(2.0);
            afterWaitMaker.action.fadeOpacityTo(0.0).duration(2.0);
        }];
        [maker groupAction:^(INSActionMaker *resetmaker) {
            resetmaker.action.moveTo(SCNVector3Make(0, 0, 0)).duration(0);
            resetmaker.action.scaleTo(0.1).duration(0);
            resetmaker.action.fadeOpacityTo(1.0).duration(0);
        }];
    }].repeatForever();
}];

```


