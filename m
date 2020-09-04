Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E025D445
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:08:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEF72866F4;
	Fri,  4 Sep 2020 09:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xYjLG5v+qGQ; Fri,  4 Sep 2020 09:08:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37F4F866EB;
	Fri,  4 Sep 2020 09:08:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A871C0051;
	Fri,  4 Sep 2020 09:08:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD4B2C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B0A8886901
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LRp5bZhYZXe for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:08:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1871D868D5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:08:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8978A3D5; Fri,  4 Sep 2020 11:08:35 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:08:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH RESEND v9 00/13] iommu: Shared Virtual Addressing for
 SMMUv3 (PT sharing part)
Message-ID: <20200904090834.GG6714@8bytes.org>
References: <20200817171558.325917-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817171558.325917-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: fenghua.yu@intel.com, robin.murphy@arm.com, zhengxiang9@huawei.com,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 17, 2020 at 07:15:46PM +0200, Jean-Philippe Brucker wrote:
> Jean-Philippe Brucker (12):
>   iommu/ioasid: Add ioasid references
>   iommu/sva: Add PASID helpers
>   arm64: mm: Pin down ASIDs for sharing mm with devices
>   iommu/io-pgtable-arm: Move some definitions to a header
>   arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
>   iommu/arm-smmu-v3: Move definitions to a header
>   iommu/arm-smmu-v3: Share process page tables
>   iommu/arm-smmu-v3: Seize private ASID
>   iommu/arm-smmu-v3: Check for SVA features
>   iommu/arm-smmu-v3: Add SVA device feature
>   iommu/arm-smmu-v3: Implement iommu_sva_bind/unbind()
>   iommu/arm-smmu-v3: Hook up ATC invalidation to mm ops

Looks like the mm parts still need Acks/Reviews?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
