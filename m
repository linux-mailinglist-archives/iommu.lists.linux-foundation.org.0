Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D220BF1D
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 09:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E03F48881A;
	Sat, 27 Jun 2020 07:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4fwvhnbW2Do; Sat, 27 Jun 2020 07:02:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06D6F88163;
	Sat, 27 Jun 2020 07:02:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCBBDC016F;
	Sat, 27 Jun 2020 07:02:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1334C016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CE4C985582
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNvHdGI8k5Zf for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 07:02:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 874A385549
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:02:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9E9AF68B02; Sat, 27 Jun 2020 09:02:36 +0200 (CEST)
Date: Sat, 27 Jun 2020 09:02:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Lemon <jonathan.lemon@gmail.com>
Subject: Re: the XSK buffer pool needs be to reverted
Message-ID: <20200627070236.GA11854@lst.de>
References: <20200626074725.GA21790@lst.de>
 <20200626205412.xfe4lywdbmh3kmri@bsd-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626205412.xfe4lywdbmh3kmri@bsd-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: netdev@vger.kernel.org, iommu@lists.linux-foundation.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Fri, Jun 26, 2020 at 01:54:12PM -0700, Jonathan Lemon wrote:
> On Fri, Jun 26, 2020 at 09:47:25AM +0200, Christoph Hellwig wrote:
> >
> > Note that this is somewhat urgent, as various of the APIs that the code
> > is abusing are slated to go away for Linux 5.9, so this addition comes
> > at a really bad time.
> 
> Could you elaborate on what is upcoming here?

Moving all these calls out of line, and adding a bypass flag to avoid
the indirect function call for IOMMUs in direct mapped mode.

> Also, on a semi-related note, are there limitations on how many pages
> can be left mapped by the iommu?  Some of the page pool work involves
> leaving the pages mapped instead of constantly mapping/unmapping them.

There are, but I think for all modern IOMMUs they are so big that they
don't matter.  Maintaines of the individual IOMMU drivers might know
more.

> On a heavily loaded box with iommu enabled, it seems that quite often
> there is contention on the iova_lock.  Are there known issues in this
> area?

I'll have to defer to the IOMMU maintainers, and for that you'll need
to say what code you are using.  Current mainlaine doesn't even have
an iova_lock anywhere.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
