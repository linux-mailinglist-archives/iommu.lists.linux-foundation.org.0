Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE22FCF3F
	for <lists.iommu@lfdr.de>; Wed, 20 Jan 2021 13:07:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8EEDE2038F;
	Wed, 20 Jan 2021 12:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwRCiGuTNvf0; Wed, 20 Jan 2021 12:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 866B1203AC;
	Wed, 20 Jan 2021 12:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79BD3C013A;
	Wed, 20 Jan 2021 12:06:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A09D0C013A
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 12:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8D793869A4
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 12:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mryr-GOYWmve for <iommu@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 12:06:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F100869A0
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 12:06:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8622E23339;
 Wed, 20 Jan 2021 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611144411;
 bh=j6xaRuX/+evv50PTBz0NflcJzFpdcyGQgGYXKX0GS9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CXc3wAjB4TWuamYBWPQUOZY2c4omdr9uEBrlJ1ZRAb1uIqYqERIMbEER2O+u9VXsc
 l49aTSGH/h7oUCL9mjRd8xRWozhoXptttR4T2LWpE7AszGZpb0nTSFFfhNn1d+Pa0E
 3ujn58JhypfXnCrpmIpbcBQyv3EP+VFhis6hj2Bc=
Date: Wed, 20 Jan 2021 13:06:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] iommu/vt-d: gracefully handle DMAR units with no
 supported address widths
Message-ID: <YAgc2MX2c2N/rGDM@kroah.com>
References: <549928db2de6532117f36c9c810373c14cf76f51.camel@infradead.org>
 <5414a3e3cdbd24ba707153584d13f06ed5dbba76.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5414a3e3cdbd24ba707153584d13f06ed5dbba76.camel@infradead.org>
Cc: "Mendoza-jonas, Samuel" <samjonas@amazon.com>, "Sironi,
 Filippo" <sironi@amazon.de>, stable@vger.kernel.org,
 iommu <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>
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

On Wed, Jan 20, 2021 at 09:42:43AM +0000, David Woodhouse wrote:
> On Thu, 2020-09-24 at 15:08 +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> > 
> > Instead of bailing out completely, such a unit can still be used for
> > interrupt remapping.
> > 
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Could we have this for stable too please, along with the trivial
> subsequent fixup. They are:
> 
> c40aaaac1018 ("iommu/vt-d: Gracefully handle DMAR units with no supported address widths")
> 9def3b1a07c4 ("iommu/vt-d: Don't dereference iommu_device if IOMMU_API is not built")
> 
> They apply fairly straightforwardly when backported; let me know if you
> want us to send patches.

What stable kernel(s) do you want this in?  The above patches are
already in 5.10.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
