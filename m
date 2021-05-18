Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B4387504
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:24:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB3C405E7;
	Tue, 18 May 2021 09:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bj_GVkhfkXW; Tue, 18 May 2021 09:24:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0174B405A0;
	Tue, 18 May 2021 09:24:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE22FC0001;
	Tue, 18 May 2021 09:24:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 204A3C0001;
 Tue, 18 May 2021 09:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EFAA4033F;
 Tue, 18 May 2021 09:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbT4mPwRmxb3; Tue, 18 May 2021 09:24:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E8EA4027F;
 Tue, 18 May 2021 09:24:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C4AEF2FA; Tue, 18 May 2021 11:24:38 +0200 (CEST)
Date: Tue, 18 May 2021 11:24:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Bixuan Cui <cuibixuan@huawei.com>
Subject: Re: [PATCH -next] iommu/virtio: Add missing MODULE_DEVICE_TABLE
Message-ID: <YKOH1SvN0CrfRgZ9@8bytes.org>
References: <20210508031451.53493-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210508031451.53493-1-cuibixuan@huawei.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>
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

On Sat, May 08, 2021 at 11:14:51AM +0800, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/iommu/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)

Applied for v5.13, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
