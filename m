Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BDA9C0C4
	for <lists.iommu@lfdr.de>; Sun, 25 Aug 2019 00:34:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 06893C83;
	Sat, 24 Aug 2019 22:34:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A5ABBC6E
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 22:34:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 19FD4735
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 22:34:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E93268AEF; Sun, 25 Aug 2019 00:34:50 +0200 (CEST)
Date: Sun, 25 Aug 2019 00:34:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Burton <paul.burton@mips.com>
Subject: Re: cleanup the dma_pgprot handling
Message-ID: <20190824223449.GC21729@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
	<20190823215759.zprrwotlbva46y33@pburton-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823215759.zprrwotlbva46y33@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Hogan <jhogan@kernel.org>, Guan Xuetao <gxt@pku.edu.cn>,
	Christoph Hellwig <hch@lst.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, Aug 23, 2019 at 09:58:04PM +0000, Paul Burton wrote:
> So I believe uncached & uncached accelerated are another case like that
> described above - they're 2 different CCAs but the same "access type",
> namely uncached.
> 
> Section 4.9 then goes on to forbid mixing access types, but not CCAs.
> 
> It would be nice if the precise mapping from CCA to access type was
> provided, but I don't see that anywhere. I can check with the
> architecture team to be sure, but to my knowledge we're fine to mix
> access via kseg1 (ie. uncached) & mappings with CCA=7 (uncached
> accelerated).

Ok.  Looks like we can keep it then and I'll add a comment to the
code with the above reference.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
