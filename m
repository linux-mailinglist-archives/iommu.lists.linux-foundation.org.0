Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E49AE2A40CA
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 10:55:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A1FA86C98;
	Tue,  3 Nov 2020 09:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpxQ59Po-2Wr; Tue,  3 Nov 2020 09:55:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3984B86C8B;
	Tue,  3 Nov 2020 09:55:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FCD4C0889;
	Tue,  3 Nov 2020 09:55:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58BD9C0889
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 46A8A86C8B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tav13xWM7Yu for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:55:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 090B486C80
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:55:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A0C467373; Tue,  3 Nov 2020 10:55:39 +0100 (CET)
Date: Tue, 3 Nov 2020 10:55:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: use of dma_direct_set_offset in (allwinner) drivers
Message-ID: <20201103095538.GA19136@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Hi all,

Linux 5.10-rc1 switched from having a single dma offset in struct device
to a set of DMA ranges, and introduced a new helper to set them,
dma_direct_set_offset.

This in fact surfaced that a bunch of drivers that violate our layering
and set the offset from drivers, which meant we had to reluctantly
export the symbol to set up the DMA range.

The drivers are:

drivers/gpu/drm/sun4i/sun4i_backend.c

  This just use dma_direct_set_offset as a fallback.  Is there any good
  reason to not just kill off the fallback?

drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c

  Same as above.

drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c

  This driver unconditionally sets the offset.  Why can't we do this
  in the device tree?

drivers/staging/media/sunxi/cedrus/cedrus_hw.c

  Same as above.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
