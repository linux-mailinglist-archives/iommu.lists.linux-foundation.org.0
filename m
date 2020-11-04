Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4802A6194
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 11:29:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8ED128676A;
	Wed,  4 Nov 2020 10:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwYImIitiLIf; Wed,  4 Nov 2020 10:29:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B4DA86762;
	Wed,  4 Nov 2020 10:29:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F19E0C1AD7;
	Wed,  4 Nov 2020 10:29:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 953FBC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8351C87487
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrGFPbbHF400 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 10:29:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68D0087483
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:29:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 69E9E68D04; Wed,  4 Nov 2020 11:29:23 +0100 (CET)
Date: Wed, 4 Nov 2020 11:29:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
Message-ID: <20201104102923.GA23981@lst.de>
References: <20201103095538.GA19136@lst.de>
 <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
 <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 Maxime Ripard <maxime@cerno.tech>, Yong Deng <yong.deng@magewell.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
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

On Wed, Nov 04, 2020 at 10:15:49AM +0000, Robin Murphy wrote:
> How about having something in the platform code that keys off the top-level 
> SoC compatible and uses a bus notifier to create offsets for the relevant 
> devices if an MBUS description is missing? At least that way the workaround 
> could be confined to a single dedicated place and look somewhat similar to 
> other special cases like sta2x11, rather than being duplicated all over the 
> place.

Yes, that would be the right way to handle the issue.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
