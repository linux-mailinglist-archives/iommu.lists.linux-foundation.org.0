Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691AB751E
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 10:30:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E8337DDE;
	Thu, 19 Sep 2019 08:30:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8B1F2DD5
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 08:30:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D63B108
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 08:30:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DA49821848;
	Thu, 19 Sep 2019 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568881840;
	bh=70jWnwAiYRqfqQ+d0aaB2GKnTdunYcF688MZOsueZew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6GQJ1/215lVfM96QTr8ENVVsdKogyfrPhCT0k1PseixGMSoQhEEP1Z/TzuSr84lW
	gN1nLwPC8WIZi5gjT9QGw/bzcwiCQrp3TM5wUyPwngZ3NRuov+zOkwt8U0JMBODnbQ
	mTEdWOY7jgI6J4EI454uaBdpsaYxd55o/QKXtAKQ=
Date: Thu, 19 Sep 2019 09:30:35 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/3] iommu/io-pgtable-arm: Mali LPAE improvements
Message-ID: <20190919083035.tv446nelad6ki6db@willie-the-truck>
References: <cover.1568211045.git.robin.murphy@arm.com>
	<d77047c2-1f16-eded-17ba-7463310d4bba@baylibre.com>
	<20190911162024.i2sda7uzy3pbrnyd@willie-the-truck>
	<83c45e97-8398-349d-5593-03af23b39c59@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83c45e97-8398-349d-5593-03af23b39c59@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robh@kernel.org, tomeu.vizoso@collabora.com,
	Neil Armstrong <narmstrong@baylibre.com>, steven.price@arm.com,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On Wed, Sep 11, 2019 at 06:19:40PM +0100, Robin Murphy wrote:
> On 2019-09-11 5:20 pm, Will Deacon wrote:
> > On Wed, Sep 11, 2019 at 06:19:04PM +0200, Neil Armstrong wrote:
> > > On 11/09/2019 16:42, Robin Murphy wrote:
> > > > Here's the eagerly-awaited fix to unblock T720/T820, plus a couple of
> > > > other bits that I've collected so far. I'm not considering this as
> > > > 5.3 fixes material, but it would be nice if there's any chance still
> > > > to sneak it into 5.4.
> > > > 
> > > > Robin.
> > > > 
> > > > 
> > > > Robin Murphy (3):
> > > >    iommu/io-pgtable-arm: Correct Mali attributes
> > > >    iommu/io-pgtable-arm: Support more Mali configurations
> > > >    iommu/io-pgtable-arm: Allow coherent walks for Mali
> > > > 
> > > >   drivers/iommu/io-pgtable-arm.c | 61 ++++++++++++++++++++++++++--------
> > > >   1 file changed, 48 insertions(+), 13 deletions(-)
> > > > 
> > > 
> > > Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> > > 
> > > On Khadas VIM2 (Amlogic S912) with T820 Mali GPU
> > > 
> > > I hope this will be part of v5.4 so we can run panfrost on vanilla v5.4 !
> > 
> > Not a chance -- the merge window opens on Monday and -next isn't being
> > rolled out at the moment due to LPC. Let's shoot for 5.5 and get this
> > queued up in a few weeks.
> 
> Fair enough, that was certainly more extreme optimism than realistic
> expectation on my part :)
> 
> There is some argument for taking #1 and #2 as 5.4 fixes, though - the
> upcoming Mesa 19.2 release will enable T820 support on the userspace side -
> so let's pick that discussion up again in a few weeks.

Ok, I'll include those two in my fixes pull to Joerg at -rc1.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
