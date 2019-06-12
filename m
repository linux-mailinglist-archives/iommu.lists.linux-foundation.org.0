Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5C42509
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 14:09:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2EBAA1B5A;
	Wed, 12 Jun 2019 12:09:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 020051B51
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 12:07:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9892379
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 12:07:22 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 4822868B02; Wed, 12 Jun 2019 14:06:54 +0200 (CEST)
Date: Wed, 12 Jun 2019 14:06:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver Neukum <oneukum@suse.com>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190612120653.GA25285@lst.de>
References: <20190611064158.GA20601@lst.de>
	<Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
	<20190612073059.GA20086@lst.de> <1560339966.9728.18.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560339966.9728.18.camel@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, Christoph Hellwig <hch@lst.de>
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

On Wed, Jun 12, 2019 at 01:46:06PM +0200, Oliver Neukum wrote:
> > Thay is someething the virt_boundary prevents.  But could still give
> > you something like:
> > 
> > 	1536 4096 4096 1024
> > 
> > or
> > 	1536 16384 8192 4096 16384 512
> 
> That would kill the driver, if maxpacket were 1024.
> 
> USB has really two kinds of requirements
> 
> 1. What comes from the protocol
> 2. What comes from the HCD
> 
> The protocol wants just multiples of maxpacket. XHCI can satisfy
> that in arbitrary scatter/gather. Other HCs cannot.

We have no real way to enforce that for the other HCs unfortunately.
I can't really think of any better way to handle their limitations
except for setting max_segments to 1 or bounce buffering.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
