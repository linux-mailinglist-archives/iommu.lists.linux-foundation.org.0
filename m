Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C4174DB7
	for <lists.iommu@lfdr.de>; Sun,  1 Mar 2020 15:43:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6475983F06;
	Sun,  1 Mar 2020 14:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UZaULw3ZWTk; Sun,  1 Mar 2020 14:43:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B7E3C8362C;
	Sun,  1 Mar 2020 14:43:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC1C4C013E;
	Sun,  1 Mar 2020 14:43:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAC20C013E
 for <iommu@lists.linux-foundation.org>; Sun,  1 Mar 2020 14:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A364C87861
 for <iommu@lists.linux-foundation.org>; Sun,  1 Mar 2020 14:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhzqYEcNptGu for <iommu@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:42:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5B0758782E
 for <iommu@lists.linux-foundation.org>; Sun,  1 Mar 2020 14:42:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 71AEC68BE1; Sun,  1 Mar 2020 15:42:54 +0100 (CET)
Date: Sun, 1 Mar 2020 15:42:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: take the bus_dma_limit into account on arm
Message-ID: <20200301144253.GB22459@lst.de>
References: <20200218184103.35932-1-hch@lst.de>
 <6e0988f4-7958-29d9-6249-24ee51edee3a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e0988f4-7958-29d9-6249-24ee51edee3a@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "Nori, Sekhar" <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

As there seems no movement I've added it to my for-next branch so that
it at least gets some linux-next exposure.

But it really needs a few reviews.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
