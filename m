Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A512C554B95
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 15:43:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BC08249E;
	Wed, 22 Jun 2022 13:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BC08249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t33k2f8k6ZVr; Wed, 22 Jun 2022 13:43:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 23D2D82848;
	Wed, 22 Jun 2022 13:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23D2D82848
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC602C0081;
	Wed, 22 Jun 2022 13:43:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1125FC002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EADC641C0A
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EADC641C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpg7ZxiioYfc for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 13:43:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1A041A4C
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1A041A4C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:43:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4F96D2D0; Wed, 22 Jun 2022 15:43:40 +0200 (CEST)
Date: Wed, 22 Jun 2022 15:43:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] iommu: Remove usage of the deprecated ida_simple_xxx API
Message-ID: <YrMci73Qko5ssAND@8bytes.org>
References: <20220617020555.2361-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617020555.2361-1-liubo03@inspur.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, Jun 16, 2022 at 10:05:55PM -0400, Bo Liu wrote:
> Use ida_alloc_xxx()/ida_free() instead of
> ida_simple_get()/ida_simple_remove().
> The latter is deprecated and more verbose.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>  drivers/iommu/iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Sorry, just applied this similar change:

https://lore.kernel.org/r/20220608021655.1538087-1-liuke94@huawei.com

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
