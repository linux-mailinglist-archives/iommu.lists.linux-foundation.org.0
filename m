Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6720F1F5
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 11:50:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 802E3884ED;
	Tue, 30 Jun 2020 09:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id griRR6BM1Bgp; Tue, 30 Jun 2020 09:49:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 72D0288531;
	Tue, 30 Jun 2020 09:49:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F8BFC016E;
	Tue, 30 Jun 2020 09:49:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87213C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 688A722219
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvT1W2NyUcdI for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 09:49:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 474DE22001
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:49:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6B7FF26B; Tue, 30 Jun 2020 11:49:51 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:49:50 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] iommu: Allow page responses without PASID
Message-ID: <20200630094949.GG28824@8bytes.org>
References: <20200616144712.748818-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616144712.748818-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Tue, Jun 16, 2020 at 04:47:14PM +0200, Jean-Philippe Brucker wrote:
> Some PCIe devices do not expect a PASID value in PRI Page Responses.
> If the "PRG Response PASID Required" bit in the PRI capability is zero,
> then the OS should not set the PASID field. Similarly on Arm SMMU,
> responses to stall events do not have a PASID.
> 
> Currently iommu_page_response() systematically checks that the PASID in
> the page response corresponds to the one in the page request. This can't
> work with virtualization because a page response coming from a guest OS
> won't have a PASID if the passed-through device does not require one.
> 
> Add a flag to page requests that declares whether the corresponding
> response needs to have a PASID. When this flag isn't set, allow page
> responses without PASID.
> 
> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  include/uapi/linux/iommu.h |  6 +++++-
>  drivers/iommu/iommu.c      | 23 +++++++++++++++++------
>  2 files changed, 22 insertions(+), 7 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
