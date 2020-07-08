Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F8217D05
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 04:23:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D98A88B9C;
	Wed,  8 Jul 2020 02:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dr9yQvM8s7qa; Wed,  8 Jul 2020 02:23:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C810288BA4;
	Wed,  8 Jul 2020 02:23:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AADD6C016F;
	Wed,  8 Jul 2020 02:23:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E4C0C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 50D88854D7
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvyV9wvm69LN for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 02:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C0D03853D9
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:22:30 +0000 (UTC)
IronPort-SDR: wyTHage9kBgAA9e2EMPWJjWCgpfN3feosfgV+sQBfEfol3mXT9MWRwwpgfd4UF839BLA0BztMg
 Cl7usVzspAXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147733946"
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="147733946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 19:22:29 -0700
IronPort-SDR: Dub4eZxS1kKjSuV6NwX9XzDX6FaUagWCkFLSQmolcN99NKKf1q5pwCvp2sUjBA7TVjV7LNC0ut
 yh+Ya6gjxBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="457325128"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2020 19:22:26 -0700
Subject: Re: [PATCH v4 3/5] iommu/uapi: Use named union for user data
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Alex Williamson <alex.williamson@redhat.com>
References: <1594165429-20075-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594165429-20075-4-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3b36c219-4120-402b-b03e-62b076db865c@linux.intel.com>
Date: Wed, 8 Jul 2020 10:17:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1594165429-20075-4-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Christoph Hellwig <hch@infradead.org>, David Woodhouse <dwmw2@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jacob,

On 7/8/20 7:43 AM, Jacob Pan wrote:
> IOMMU UAPI data size is filled by the user space which must be validated
> by ther kernel. To ensure backward compatibility, user data can only be
> extended by either re-purpose padding bytes or extend the variable sized
> union at the end. No size change is allowed before the union. Therefore,
> the minimum size is the offset of the union.
> 
> To use offsetof() on the union, we must make it named.
> 
> Link:https://lkml.org/lkml/2020/6/11/834

Please use lore.kernel.org links.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
