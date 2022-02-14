Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8694B5189
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 14:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A364405EB;
	Mon, 14 Feb 2022 13:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNXK0zcf_TWw; Mon, 14 Feb 2022 13:21:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7E649405E5;
	Mon, 14 Feb 2022 13:21:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58965C000B;
	Mon, 14 Feb 2022 13:21:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58F15C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 13:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5531B409DA
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 13:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7YDplL7y4Uh for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 13:21:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C13774092F
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 13:21:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E97D86BF; Mon, 14 Feb 2022 14:21:10 +0100 (CET)
Date: Mon, 14 Feb 2022 14:21:09 +0100
From: Joerg Roedel <joro@8bytes.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] iommu/msm: simplify with dev_err_probe()
Message-ID: <YgpXRQ9KJrgJ+Cwc@8bytes.org>
References: <20220206202945.465195-1-david@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220206202945.465195-1-david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 Will Deacon <will@kernel.org>, ~okias/devicetree@lists.sr.ht
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

On Sun, Feb 06, 2022 at 09:29:45PM +0100, David Heidelberg wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error is
> printed.
> 
> Fixes warnings as:
> msm_iommu 7500000.iommu: could not get smmu_pclk
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/iommu/msm_iommu.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
