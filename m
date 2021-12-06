Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9BD46956B
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 13:07:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12FC9400A4;
	Mon,  6 Dec 2021 12:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjPUevO6yGG4; Mon,  6 Dec 2021 12:07:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2445B40130;
	Mon,  6 Dec 2021 12:07:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBB58C0071;
	Mon,  6 Dec 2021 12:07:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD039C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0B2D40130
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJKFwuabDe5x for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 12:07:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3902400D9
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:07:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 63B843FC; Mon,  6 Dec 2021 13:07:20 +0100 (CET)
Date: Mon, 6 Dec 2021 13:07:19 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 0/4] iommu: M1 Pro/Max DART support
Message-ID: <Ya389/JeUcDzBWlk@8bytes.org>
References: <20211117211509.28066-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117211509.28066-1-sven@svenpeter.dev>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

Hi Sven,

On Wed, Nov 17, 2021 at 10:15:05PM +0100, Sven Peter wrote:
> Sven Peter (4):
>   dt-bindings: iommu: dart: add t6000 compatible
>   iommu/io-pgtable: Add DART subpage protection support
>   iommu/io-pgtable: Add DART PTE support for t6000
>   iommu: dart: Support t6000 variant

Looks good to me, will apply it when Robin had a chance to look at the
io-pgtable changes.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
