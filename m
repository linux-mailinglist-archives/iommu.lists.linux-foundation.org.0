Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7246D757
	for <lists.iommu@lfdr.de>; Wed,  8 Dec 2021 16:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC7260804;
	Wed,  8 Dec 2021 15:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSs-p868k0Ia; Wed,  8 Dec 2021 15:49:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F01560A46;
	Wed,  8 Dec 2021 15:49:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3318C006E;
	Wed,  8 Dec 2021 15:49:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC7D2C0012
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 15:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EA1A60802
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 15:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpLL-2g0c0Y5 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 15:49:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D574607F9
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 15:49:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6976E68AFE; Wed,  8 Dec 2021 16:48:55 +0100 (CET)
Date: Wed, 8 Dec 2021 16:48:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 11/11] dma-direct: add a dma_direct_use_pool helper
Message-ID: <20211208154855.GA14807@lst.de>
References: <20211111065028.32761-1-hch@lst.de>
 <20211111065028.32761-12-hch@lst.de>
 <CGME20211208154459eucas1p24743399c20b5d1fbc3f519d68d9660a6@eucas1p2.samsung.com>
 <4e0eafe8-075d-c249-0298-d2612faa5704@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e0eafe8-075d-c249-0298-d2612faa5704@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, David Rientjes <rientjes@google.com>
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

I've force pushed out the fixed version, thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
