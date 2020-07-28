Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CB230DD9
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 17:31:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21BC58697E;
	Tue, 28 Jul 2020 15:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBGwrRsZPHA3; Tue, 28 Jul 2020 15:31:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B801484C4E;
	Tue, 28 Jul 2020 15:31:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5374C004D;
	Tue, 28 Jul 2020 15:31:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B264FC004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94F30226D4
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozjwOJtj+MbM for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 15:31:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A52C226B0
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:30:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E75DF68B05; Tue, 28 Jul 2020 17:30:55 +0200 (CEST)
Date: Tue, 28 Jul 2020 17:30:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Amit Pundir <amit.pundir@linaro.org>
Subject: Re: dma-pool fixes
Message-ID: <20200728153055.GA16701@lst.de>
References: <20200728104742.422960-1-hch@lst.de>
 <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
 <20200728120716.GA2507@lst.de>
 <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Jul 28, 2020 at 06:18:41PM +0530, Amit Pundir wrote:
> > Oh well, this leaves me confused again.  It looks like your setup
> > really needs a CMA in zone normal for the dma or dma32 pool.
> 
> Anything I should look up in the downstream kernel/dts?

I don't have a good idea right now.  Nicolas, can you think of something
else?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
