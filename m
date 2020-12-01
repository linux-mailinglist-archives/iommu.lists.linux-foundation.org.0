Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D732CA70E
	for <lists.iommu@lfdr.de>; Tue,  1 Dec 2020 16:27:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 018D921FA9;
	Tue,  1 Dec 2020 15:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Vyr7C1cZPwD; Tue,  1 Dec 2020 15:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AE450203BE;
	Tue,  1 Dec 2020 15:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91CA6C0859;
	Tue,  1 Dec 2020 15:27:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92FAEC0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 13:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7771D8699B
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 13:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5MNNBUP7Euj for <iommu@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 13:33:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59ECC86992
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 13:33:32 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cljhz3sStzhl60;
 Tue,  1 Dec 2020 21:33:07 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Dec 2020
 21:33:18 +0800
From: Xingang Wang <wangxingang5@huawei.com>
To: <eric.auger@redhat.com>
Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
Date: Tue, 1 Dec 2020 13:33:10 +0000
Message-ID: <1606829590-25924-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <20201118112151.25412-8-eric.auger@redhat.com>
References: <20201118112151.25412-8-eric.auger@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Dec 2020 15:27:37 +0000
Cc: xieyingtai@huawei.com, jean-philippe@linaro.org, kvm@vger.kernel.org,
 maz@kernel.org, will@kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, vivek.gautam@arm.com, alex.williamson@redhat.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, kvmarm@lists.cs.columbia.edu,
 eric.auger.pro@gmail.com
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

Hi Eric

On  Wed, 18 Nov 2020 12:21:43, Eric Auger wrote:
>@@ -1710,7 +1710,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
> 	 * insertion to guarantee those are observed before the TLBI. Do be
> 	 * careful, 007.
> 	 */
>-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>+	if (ext_asid >= 0) { /* guest stage 1 invalidation */
>+		cmd.opcode	= CMDQ_OP_TLBI_NH_ASID;
>+		cmd.tlbi.asid	= ext_asid;
>+		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
>+	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {

Found a problem here, the cmd for guest stage 1 invalidation is built,
but it is not delivered to smmu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
