Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4E3D5978
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:27:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213C8837A4;
	Mon, 26 Jul 2021 12:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhh-UvVGP648; Mon, 26 Jul 2021 12:27:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 51C2A83704;
	Mon, 26 Jul 2021 12:27:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36332C001F;
	Mon, 26 Jul 2021 12:27:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B60D5C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2827830C0
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8hMw1hF-9DC for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:27:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A5A2830AB
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:27:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 565562B0; Mon, 26 Jul 2021 14:27:31 +0200 (CEST)
Date: Mon, 26 Jul 2021 14:27:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] iommu/dma: Fix leak in non-contiguous API
Message-ID: <YP6qMWbhZKFO9ADf@8bytes.org>
References: <20210723010552.50969-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723010552.50969-1-ezequiel@collabora.com>
Cc: stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ricardo Ribalda <ribalda@chromium.org>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-media@vger.kernel.org
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

On Thu, Jul 22, 2021 at 10:05:52PM -0300, Ezequiel Garcia wrote:
>  drivers/iommu/dma-iommu.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to iommu/fixes, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
