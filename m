Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F21FB5C5
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 17:15:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E7BF8947D;
	Tue, 16 Jun 2020 15:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79p8q4Q7WV36; Tue, 16 Jun 2020 15:15:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 46FF689494;
	Tue, 16 Jun 2020 15:15:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C83EC016E;
	Tue, 16 Jun 2020 15:15:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5B23C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A18688947D
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIArmgXFX8Tg for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:15:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EBFBE890D5
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:15:45 +0000 (UTC)
IronPort-SDR: m2YgwiB4mfRgK7H4IXPuPxcGSpUhKOBAqXuhLAPdJicmRFmbfX6I9ip1Q6KPFI9VRjrupmjRA6
 Z4lL1nOwLhRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 08:15:45 -0700
IronPort-SDR: n1885/AvwQW6RHQ0gOhNxz+f6MggStKTc9mydEKv3qqA/HV3Ui8qqtqJd04eZ19F61nluF+pUP
 wNsPZKWJuJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="449871882"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 16 Jun 2020 08:15:44 -0700
Date: Tue, 16 Jun 2020 08:22:12 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: IOMMU user API
Message-ID: <20200616082212.0c1611dd@jacob-builder>
In-Reply-To: <20200611172727.78dbb822@jacob-builder>
References: <1591848735-12447-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1591848735-12447-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200611094741.6d118fa8@w520.home>
 <20200611125205.1e0280d3@jacob-builder>
 <20200611144047.79613c32@x1.home>
 <20200611172727.78dbb822@jacob-builder>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph
 Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

On Thu, 11 Jun 2020 17:27:27 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> > 
> > But then I thought it even better if VFIO leaves the entire
> > copy_from_user() to the layer consuming it.
> >   
> OK. Sounds good, that was what Kevin suggested also. I just wasn't
> sure how much VFIO wants to inspect, I thought VFIO layer wanted to
> do a sanity check.
> 
> Anyway, I will move copy_from_user to iommu uapi layer.

Just one more point brought up by Yi when we discuss this offline.

If we move copy_from_user to iommu uapi layer, then there will be
multiple copy_from_user calls for the same data when a VFIO container
has multiple domains, devices. For bind, it might be OK. But might be
additional overhead for TLB flush request from the guest.

Thoughts?

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
