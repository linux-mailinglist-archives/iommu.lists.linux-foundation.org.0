Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67F2237CC
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 11:08:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BA17882D3;
	Fri, 17 Jul 2020 09:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIk6dmRSg8hy; Fri, 17 Jul 2020 09:08:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63F16882C4;
	Fri, 17 Jul 2020 09:08:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4400FC0733;
	Fri, 17 Jul 2020 09:08:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C16CAC0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3DE88822A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2YDk-CcFP7X for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 09:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61EE1882B1
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:08:06 +0000 (UTC)
Received: from dggemi404-hub.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id A7392E30ACC198C40E8B;
 Fri, 17 Jul 2020 17:07:59 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.52]) by
 dggemi404-hub.china.huawei.com ([10.3.17.142]) with mapi id 14.03.0487.000;
 Fri, 17 Jul 2020 17:07:48 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Robin Murphy <robin.murphy@arm.com>, "will@kernel.org" <will@kernel.org>, 
 "joro@8bytes.org" <joro@8bytes.org>
Subject: RE: [PATCH] iommu/arm-smmu-v3: remove the approach of MSI polling
 for CMD SYNC
Thread-Topic: [PATCH] iommu/arm-smmu-v3: remove the approach of MSI polling
 for CMD SYNC
Thread-Index: AQHWW8YiwSsIgpwKv0qM0ZdQNf6ByakK8iGAgACG1CA=
Date: Fri, 17 Jul 2020 09:07:48 +0000
Message-ID: <B926444035E5E2439431908E3842AFD25900C6@DGGEMI525-MBS.china.huawei.com>
References: <20200716230709.32820-1-song.bao.hua@hisilicon.com>
 <35b54698-bd43-a8fc-00db-94ee0dfc789f@arm.com>
In-Reply-To: <35b54698-bd43-a8fc-00db-94ee0dfc789f@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.111]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Linuxarm <linuxarm@huawei.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



> -----Original Message-----
> From: Robin Murphy [mailto:robin.murphy@arm.com]
> Sent: Friday, July 17, 2020 8:55 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; will@kernel.org;
> joro@8bytes.org
> Cc: linux-kernel@vger.kernel.org; Linuxarm <linuxarm@huawei.com>;
> linux-arm-kernel@lists.infradead.org; iommu@lists.linux-foundation.org;
> Zengtao (B) <prime.zeng@hisilicon.com>
> Subject: Re: [PATCH] iommu/arm-smmu-v3: remove the approach of MSI
> polling for CMD SYNC
> 
> On 2020-07-17 00:07, Barry Song wrote:
> > Before commit 587e6c10a7ce ("iommu/arm-smmu-v3: Reduce contention
> during
> > command-queue insertion"), msi polling perhaps performed better since
> > it could run outside the spin_lock_irqsave() while the code polling cons
> > reg was running in the lock.
> >
> > But after the great reorganization of smmu queue, neither of these two
> > polling methods are running in a spinlock. And real tests show polling
> > cons reg via sev means smaller latency. It is probably because polling
> > by msi will ask hardware to write memory but sev polling depends on the
> > update of register only.
> >
> > Using 16 threads to run netperf on hns3 100G NIC with UDP packet size
> > in 32768bytes and set iommu to strict, TX throughput can improve from
> > 25227.74Mbps to 27145.59Mbps by this patch. In this case, SMMU is super
> > busy as hns3 sends map/unmap requests extremely frequently.
> 
> How many different systems and SMMU implementations are those numbers
> representative of? Given that we may have cases where the SMMU can use
> MSIs but can't use SEV, so would have to fall back to inefficient
> busy-polling, I'd be wary of removing this entirely. Allowing particular
> platforms or SMMU implementations to suppress MSI functionality if they
> know for sure it makes sense seems like a safer bet.
> 
Hello Robin,

Thanks for taking a look. Actually I was really struggling with the good way to make every platform happy.
And I don't have other platforms to test and check if those platforms run better by sev polling. Even two
platforms have completely same SMMU features, it is still possible they behave differently.
So I simply sent this patch to get the discussion started to get opinions.

At the first beginning, I wanted to have a module parameter for users to decide if msi polling should be disabled.
But the module parameter might be totally ignored by linux distro.

--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -418,6 +418,11 @@ module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);  MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
+static bool disable_msipolling = 1;
+module_param_named(disable_msipolling, disable_msipolling, bool, 
+S_IRUGO); MODULE_PARM_DESC(disable_msipolling,
+	"Don't use MSI to poll the completion of CMD_SYNC if it is slower than 
+SEV");
+
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
@@ -992,7 +997,7 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
 	 * payload, so the write will zero the entire command on that platform.
 	 */
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
+	if (!disable_msipolling && smmu->features & ARM_SMMU_FEAT_MSI &&
 	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
 		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
 				   q->ent_dwords * 8;
@@ -1332,7 +1337,7 @@ static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *smmu,  static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
 					 struct arm_smmu_ll_queue *llq)
 {
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
+	if (!disable_msipolling && smmu->features & ARM_SMMU_FEAT_MSI &&
 	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
 		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);


Another option is that we don't use module parameter, alternatively, we check the vendor/chip ID,
if the chip has better performance on sev polling, it may set disable_msipolling to true.

You are very welcome to give your suggestions.

Thanks
Barry
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
