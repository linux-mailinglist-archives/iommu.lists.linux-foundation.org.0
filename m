Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1913ECF52
	for <lists.iommu@lfdr.de>; Mon, 16 Aug 2021 09:25:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2AE80E23;
	Mon, 16 Aug 2021 07:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No6s-nTn5Vrd; Mon, 16 Aug 2021 07:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC5780E16;
	Mon, 16 Aug 2021 07:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42239C001F;
	Mon, 16 Aug 2021 07:25:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A46C0C000E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D8F2402C8
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 07:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gsx8djZXUObw for <iommu@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 07:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F4E540299
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 07:25:23 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gp5JZ5R3Hz6CC2Y;
 Mon, 16 Aug 2021 15:24:30 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Mon, 16 Aug 2021 09:25:20 +0200
Received: from [10.47.92.15] (10.47.92.15) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 16 Aug
 2021 08:25:20 +0100
Subject: Re: [PATCH 1/4] iommu/arm-smmu-v3: Use command queue batching helpers
 to improve performance
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
References: <20210811114852.2429-1-thunder.leizhen@huawei.com>
 <20210811114852.2429-2-thunder.leizhen@huawei.com>
 <81258eb7-eb73-8a32-0983-3487daba1167@arm.com>
 <4e741216-d6e7-c40c-f257-242cd2fea302@huawei.com>
 <5482d2e5-24db-6139-a8a8-74be1282e2ec@huawei.com>
 <52204403-f69a-d2b9-9365-7553e87d1298@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <a3cdd5df-c028-5484-ce99-928a689d341a@huawei.com>
Date: Mon, 16 Aug 2021 08:24:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <52204403-f69a-d2b9-9365-7553e87d1298@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.47.92.15]
X-ClientProxiedBy: lhreml739-chm.china.huawei.com (10.201.108.189) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> In addition, I find that function arm_smmu_cmdq_build_cmd() can also be optimized
> slightly, three useless instructions can be reduced.

I think that you could optimise further by pre-building commonly used 
commands.

For example, CMD_SYNC without MSI polling is always the same. And then 
only different in 1 field for MSI polling.

But you need to check if the performance gain is worth the change.

> 
> Case 1):
> void arm_smmu_cmdq_build_cmd_tst1(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> {
>          memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
>          cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> }
> 0000000000004608 <arm_smmu_cmdq_build_cmd_tst1>:
>      4608:       a9007c1f        stp     xzr, xzr, [x0]
>      460c:       39400022        ldrb    w2, [x1]
>      4610:       f9400001        ldr     x1, [x0]
>      4614:       aa020021        orr     x1, x1, x2
>      4618:       f9000001        str     x1, [x0]
>      461c:       d65f03c0        ret
> 
> Case 2):
> void arm_smmu_cmdq_build_cmd_tst2(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> {
>          int i;
> 
>          cmd[0] = FIELD_PREP(CMDQ_0_OP, ent->opcode);
>          for (i = 1; i < CMDQ_ENT_DWORDS; i++)
>                  cmd[i] = 0;
> }
> 0000000000004620 <arm_smmu_cmdq_build_cmd_tst2>:
>      4620:       39400021        ldrb    w1, [x1]
>      4624:       a9007c01        stp     x1, xzr, [x0]
>      4628:       d65f03c0        ret
>      462c:       d503201f        nop
> 
> Case 3):
> void arm_smmu_cmdq_build_cmd_tst3(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> {
>          memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
>          cmd[0] = FIELD_PREP(CMDQ_0_OP, ent->opcode);
> }
> 0000000000004630 <arm_smmu_cmdq_build_cmd_tst3>:
>      4630:       a9007c1f        stp     xzr, xzr, [x0]
>      4634:       39400021        ldrb    w1, [x1]
>      4638:       f9000001        str     x1, [x0]
>      463c:       d65f03c0        ret
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
