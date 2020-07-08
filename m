Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A4218AE7
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:13:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F63584C4E;
	Wed,  8 Jul 2020 15:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIlEhV728D_i; Wed,  8 Jul 2020 15:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CC6684B26;
	Wed,  8 Jul 2020 15:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FAE8C08A9;
	Wed,  8 Jul 2020 15:12:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22035C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1135B88604
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cmlrvll9Z+g for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F987870F6
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:12:21 +0000 (UTC)
IronPort-SDR: fLZx+VJGIM6WrGmCqcpYccyP4qdXzY3Q8epMtcsZmpsU2lkRb/4dlETMeE5GqgDsx92P7TZ+ki
 x6Kxmu4jLAKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="147823632"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="147823632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 08:12:20 -0700
IronPort-SDR: /MVkUG8GhZH1siJlqEVBaQOSKpuUsBci6rmNU/vkTH1JLRLuD7R56lPhmqa2xMGebYejjce4y/
 KN1FCGXMa4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="457534824"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 08 Jul 2020 08:12:20 -0700
Date: Wed, 8 Jul 2020 08:18:58 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 3/5] iommu/uapi: Use named union for user data
Message-ID: <20200708081858.37091f4b@jacob-builder>
In-Reply-To: <3b36c219-4120-402b-b03e-62b076db865c@linux.intel.com>
References: <1594165429-20075-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594165429-20075-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <3b36c219-4120-402b-b03e-62b076db865c@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

On Wed, 8 Jul 2020 10:17:57 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Jacob,
> 
> On 7/8/20 7:43 AM, Jacob Pan wrote:
> > IOMMU UAPI data size is filled by the user space which must be
> > validated by ther kernel. To ensure backward compatibility, user
> > data can only be extended by either re-purpose padding bytes or
> > extend the variable sized union at the end. No size change is
> > allowed before the union. Therefore, the minimum size is the offset
> > of the union.
> > 
> > To use offsetof() on the union, we must make it named.
> > 
> > Link:https://lkml.org/lkml/2020/6/11/834  
> 
> Please use lore.kernel.org links.
> 
OK. will do.

> Best regards,
> baolu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
