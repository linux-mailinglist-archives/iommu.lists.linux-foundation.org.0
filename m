Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74C37AC91
	for <lists.iommu@lfdr.de>; Tue, 11 May 2021 19:01:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 061E34029E;
	Tue, 11 May 2021 17:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTs4sTSecJNH; Tue, 11 May 2021 17:01:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C71401F3;
	Tue, 11 May 2021 17:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6ABCC0024;
	Tue, 11 May 2021 17:01:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54EB5C0001
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD9E60683
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 17:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ww1I4JpSpHmZ for <iommu@lists.linux-foundation.org>;
 Tue, 11 May 2021 17:01:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95F026066B
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 17:01:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 14EDB67373; Tue, 11 May 2021 19:01:02 +0200 (CEST)
Date: Tue, 11 May 2021 19:01:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)]
Message-ID: <20210511170101.GA20936@lst.de>
References: <osstest-161829-mainreport@xen.org>
 <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de>
 <alpine.DEB.2.21.2105101818260.5018@sstabellini-ThinkPad-T480s>
 <20210511063558.GA7605@lst.de>
 <alpine.DEB.2.21.2105110925430.5018@sstabellini-ThinkPad-T480s>
 <20210511164933.GA19775@lst.de>
 <alpine.DEB.2.21.2105110950580.5018@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2105110950580.5018@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: f.fainelli@gmail.com, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, May 11, 2021 at 09:51:20AM -0700, Stefano Stabellini wrote:
> On Tue, 11 May 2021, Christoph Hellwig wrote:
> > On Tue, May 11, 2021 at 09:47:33AM -0700, Stefano Stabellini wrote:
> > > That's a much better plan. It is also not super urgent, so maybe for now
> > > we could add an explicit check for io_tlb_default_mem != NULL at the
> > > beginning of xen_swiotlb_init? So that at least we can fail explicitly
> > > or ignore it explicitly rather than by accident.
> > 
> > Fine with me.  Do you want to take over from here and test and submit
> > your version?
> 
> I can do that. Can I add your signed-off-by for your original fix?

Sure:

Signed-off-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
