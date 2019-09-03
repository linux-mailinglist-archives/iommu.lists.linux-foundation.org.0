Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E13A6923
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 14:58:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D781D30;
	Tue,  3 Sep 2019 12:58:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 240EBC37
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 12:58:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37FAC756
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 12:58:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 6786C284; Tue,  3 Sep 2019 14:58:50 +0200 (CEST)
Date: Tue, 3 Sep 2019 14:58:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] iommu/arm-smmu-v3: Fix build error without
	CONFIG_PCI_ATS
Message-ID: <20190903125848.GC11530@8bytes.org>
References: <20190903024212.20300-1-yuehaibing@huawei.com>
	<20190903065056.17988-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903065056.17988-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org, will@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, Sep 03, 2019 at 02:50:56PM +0800, YueHaibing wrote:
> If CONFIG_PCI_ATS is not set, building fails:
> 
> drivers/iommu/arm-smmu-v3.c: In function arm_smmu_ats_supported:
> drivers/iommu/arm-smmu-v3.c:2325:35: error: struct pci_dev has no member named ats_cap; did you mean msi_cap?
>   return !pdev->untrusted && pdev->ats_cap;
>                                    ^~~~~~~
> 
> ats_cap should only used when CONFIG_PCI_ATS is defined,
> so use #ifdef block to guard this.
> 
> Fixes: bfff88ec1afe ("iommu/arm-smmu-v3: Rework enabling/disabling of ATS for PCI masters")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: Add arm_smmu_ats_supported() of no CONFIG_PCI_ATS
> ---
>  drivers/iommu/arm-smmu-v3.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
