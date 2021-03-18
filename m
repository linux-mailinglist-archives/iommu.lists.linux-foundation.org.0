Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC3340269
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 10:48:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDC34ED5B;
	Thu, 18 Mar 2021 09:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11YwIF1JugE7; Thu, 18 Mar 2021 09:48:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5814A4ED49;
	Thu, 18 Mar 2021 09:48:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C63C0001;
	Thu, 18 Mar 2021 09:48:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9151C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A990C840D5
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2Rdy-0tThTi for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 09:48:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79880840CB
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:48:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 01ED22D8; Thu, 18 Mar 2021 10:48:29 +0100 (CET)
Date: Thu, 18 Mar 2021 10:48:28 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3] iommu: Check dev->iommu in iommu_dev_xxx functions
Message-ID: <YFMh7E5OiMVkJCU9@8bytes.org>
References: <20210303173611.520-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303173611.520-1-shameerali.kolothum.thodi@huawei.com>
Cc: jean-philippe@linaro.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linuxarm@openeuler.org, iommu@lists.linux-foundation.org,
 prime.zeng@hisilicon.com, robin.murphy@arm.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Mar 03, 2021 at 05:36:11PM +0000, Shameer Kolothum wrote:
> The device iommu probe/attach might have failed leaving dev->iommu
> to NULL and device drivers may still invoke these functions resulting
> in a crash in iommu vendor driver code.
> =

> Hence make sure we check that.
> =

> Fixes:=A0a3a195929d40 ("iommu: Add APIs for multiple domains per device")
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> v2 --> v3
>  -Removed iommu_ops from struct dev_iommu.
> v1 --> v2:
>  -Added iommu_ops to struct dev_iommu based on the discussion with Robin.
>  -Rebased against iommu-tree core branch.
> ---
>  drivers/iommu/iommu.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
