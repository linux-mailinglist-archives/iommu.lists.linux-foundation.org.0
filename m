Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FD46F09
	for <lists.iommu@lfdr.de>; Sat, 15 Jun 2019 10:36:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7332CD4A;
	Sat, 15 Jun 2019 08:36:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08098D4A
	for <iommu@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 08:36:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7C2D5E6
	for <iommu@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 08:36:24 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id A382E68AFE; Sat, 15 Jun 2019 10:35:54 +0200 (CEST)
Date: Sat, 15 Jun 2019 10:35:54 +0200
From: "hch@lst.de" <hch@lst.de>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 7/7] arc: use the generic remapping allocator for
	coherent DMA allocations
Message-ID: <20190615083554.GC23406@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
	<20190614144431.21760-8-hch@lst.de>
	<78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "jonas@southpole.se" <jonas@southpole.se>,
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
	"vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stefan.kristiansson@saunalahti.fi" <stefan.kristiansson@saunalahti.fi>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
	"deller@gmx.de" <deller@gmx.de>, "shorne@gmail.com" <shorne@gmail.com>,
	"linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>, "hch@lst.de" <hch@lst.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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

On Fri, Jun 14, 2019 at 06:05:01PM +0000, Eugeniy Paltsev wrote:
> Hi Christoph,
> 
> Regular question - do you have any public git repository with all this dma changes?
> I want to test it for ARC.
> 
> Pretty sure the
>  [PATCH 2/7] arc: remove the partial DMA_ATTR_NON_CONSISTENT support
> is fine.
> 
> Not so sure about
>  [PATCH 7/7] arc: use the generic remapping allocator for coherent DMA allocations
> :)

   git://git.infradead.org/users/hch/misc.git dma-not-consistent-cleanup

Gitweb:

   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-not-consistent-cleanup
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
