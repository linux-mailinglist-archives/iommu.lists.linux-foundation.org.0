Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF31F6C33
	for <lists.iommu@lfdr.de>; Thu, 11 Jun 2020 18:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24E028976B;
	Thu, 11 Jun 2020 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9To1Gq7PF-cV; Thu, 11 Jun 2020 16:32:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6EAD88976D;
	Thu, 11 Jun 2020 16:32:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C372C016F;
	Thu, 11 Jun 2020 16:32:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36DBFC016F
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 16:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B004B23455
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jhfh5MyQE1mN for <iommu@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 16:32:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id AE1412045A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 16:32:03 +0000 (UTC)
IronPort-SDR: Yp5NeL70/ZvrFQJnl53XW7CNb8lmD8GAhYJ5H2u6YqRHsACb2ddSJWRPvQkGp1RoL77xkztYYV
 pK/nIaQcCyog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 09:32:02 -0700
IronPort-SDR: PVunhJ0wQk6hACj1iOao85SPmBxVDJXTBzUmMPzi+e50sgSu8TcxnrgJ77X3TkZUV8zMsAR1BU
 MmjeIE8gcdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="275387757"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 11 Jun 2020 09:32:02 -0700
Date: Thu, 11 Jun 2020 09:38:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/3] docs: IOMMU user API
Message-ID: <20200611093827.7d7a3185@jacob-builder>
In-Reply-To: <20200611075500.44fa6cd4@lwn.net>
References: <1591848735-12447-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1591848735-12447-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200611075500.44fa6cd4@lwn.net>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian,
 Kevin" <kevin.tian@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Hi Jon,

On Thu, 11 Jun 2020 07:55:00 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Wed, 10 Jun 2020 21:12:13 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> A little nit but...this pattern:
> 
> > +pattern below:
> > +
> > +::
> > +
> > +   struct {
> > +	__u32 argsz;
> > +	__u32 flags;
> > +	__u8  data[];
> > +  }  
> 
> can be more concisely and attractively written as:
> 
>    pattern below::
> 
> 	struct { 
> ...
> 
Will do. thanks!

> Thanks,
> 
> jon

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
