Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B11EAABF
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 07:51:10 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6C719AAE;
	Thu, 31 Oct 2019 06:51:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6258C255
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 06:51:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 24FAC63D
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 06:51:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6FA0C2083E;
	Thu, 31 Oct 2019 06:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572504666;
	bh=LdYyJIE33KHH3S1hU6rd+nzuIDkZi6BrCFonQIsQO00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6uzzdfy9Su0waD7iZ0/i8/UhnM9eBviFTBjStgyIiDkIphvSc3BRKVvXNf/5QfwL
	Re+iDFbGbbFwhsv3sscoE75qTElPNTwIvO65xz7cGRKsPrAUa63x1xFkGD7hTOpVdB
	OK7R6BI03tg6oLBPx+wJqnbKgPLV0PM4Ts6ImQyA=
Date: Thu, 31 Oct 2019 07:51:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 1/2] dma-mapping: Add vmap checks to dma_map_single()
Message-ID: <20191031065103.GE727325@kroah.com>
References: <20191029213423.28949-1-keescook@chromium.org>
	<20191029213423.28949-2-keescook@chromium.org>
	<20191030091849.GA637042@kroah.com> <20191030180921.GB19366@lst.de>
	<20191030192640.GC709410@kroah.com> <20191030194532.GA21020@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030194532.GA21020@lst.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>,
	Semmle Security Reports <security-reports@semmle.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Allison Randal <allison@lohutok.net>
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

On Wed, Oct 30, 2019 at 08:45:32PM +0100, Christoph Hellwig wrote:
> On Wed, Oct 30, 2019 at 08:26:40PM +0100, Greg Kroah-Hartman wrote:
> > Looks good!  You can apply patch 2/2 as well if you want to take that
> > through your tree too.
> 
> I can do that, I'll just need a formal ACK from you.

Now sent, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
