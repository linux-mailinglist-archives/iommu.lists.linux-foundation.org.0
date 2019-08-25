Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA969C134
	for <lists.iommu@lfdr.de>; Sun, 25 Aug 2019 03:10:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B017BC8E;
	Sun, 25 Aug 2019 01:10:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DB6EBE4
	for <iommu@lists.linux-foundation.org>;
	Sun, 25 Aug 2019 01:10:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2020E67F
	for <iommu@lists.linux-foundation.org>;
	Sun, 25 Aug 2019 01:10:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BCB0D68AEF; Sun, 25 Aug 2019 03:10:25 +0200 (CEST)
Date: Sun, 25 Aug 2019 03:10:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 2/2] dma-contiguous: Use fallback alloc_pages for
	single pages
Message-ID: <20190825011025.GA23410@lst.de>
References: <20190506223334.1834-1-nicoleotsuka@gmail.com>
	<20190506223334.1834-3-nicoleotsuka@gmail.com>
	<CAK7LNARacEorb38mVBw_V-Zvz-znWgBma1AP1-z_5B_xZU4ogg@mail.gmail.com>
	<CAK7LNAQfYBCoChMV=MOwcUyVoqRkrPWs7DaWdzDqjBe18gGiAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAQfYBCoChMV=MOwcUyVoqRkrPWs7DaWdzDqjBe18gGiAQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>,
	linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Chris Zankel <chris@zankel.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-mmc <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	iommu@lists.linux-foundation.org, iamjoonsoo.kim@lge.com,
	David Woodhouse <dwmw2@infradead.org>
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

On Fri, Aug 23, 2019 at 09:56:52PM +0900, Masahiro Yamada wrote:
> + linux-mmc, Ulf Hansson, Adrian Hunter,
> 
> 
> ADMA of SDHCI is not working
> since bd2e75633c8012fc8a7431c82fda66237133bf7e

Does it work for you with this commit:

http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/90ae409f9eb3bcaf38688f9ec22375816053a08e
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
