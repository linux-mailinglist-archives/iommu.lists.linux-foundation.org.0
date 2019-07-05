Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2160097
	for <lists.iommu@lfdr.de>; Fri,  5 Jul 2019 07:25:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7443AC6F;
	Fri,  5 Jul 2019 05:25:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B732AC6F
	for <iommu@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 05:25:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A16E70D
	for <iommu@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 05:25:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A95CA21721;
	Fri,  5 Jul 2019 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562304334;
	bh=mtXsvHvLDkWbJ9xgmQLic9CLP84bbrhMy2js7vuIlmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThThFvL+Z4Ju45y7D8IlcJ857mOE01Tjyomvi+D6wjtVHOmyvvaA5eCULOVTG8aEB
	e6lelSwMxMeeUwN0SdwnJ3fd8r0+Jf2ht/9VeUqgeGcXbbUfn5sDMbNx++nV5gRIFv
	wOxSVjo/8T291lzMf9OIWmA3xxK8WPb+1KEb/8Z0=
Date: Fri, 5 Jul 2019 07:24:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] omap-iommu: no need to check return value of
	debugfs_create functions
Message-ID: <20190705052425.GA8544@kroah.com>
References: <20190704143649.GA11697@kroah.com>
	<20190704153551.GG3310@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704153551.GG3310@8bytes.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 04, 2019 at 05:35:52PM +0200, Joerg Roedel wrote:
> On Thu, Jul 04, 2019 at 04:36:49PM +0200, Greg Kroah-Hartman wrote:
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> > 
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: iommu@lists.linux-foundation.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > Warning, not even test-built, but "should" work :)
> 
> It almost did :)
> 
> > +	debugfs_create_file("regs", 0400, d, obj, &attrregs_fops);
> > +	debugfs_create_file("tlb", 0400, d, obj, &attrtlb_fops);
> > +	debugfs_create_file("pagetable", 0400, d, obj, &attrpagetable_fops);
> 
> The _fops were named without the 'attr' prefix, changed that and it
> compiled. Patch is now applied.

Ah, so close :)

Thanks for fixing it up and applying it!

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
