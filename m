Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4CE217CF3
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 04:11:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F7A8872EA;
	Wed,  8 Jul 2020 02:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiRxZ3G20JJv; Wed,  8 Jul 2020 02:11:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35CC1872FF;
	Wed,  8 Jul 2020 02:11:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C53EC08A9;
	Wed,  8 Jul 2020 02:11:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A6E4C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3857D872EA
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUBxMZX6OcKk for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 02:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 56749872D3
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:11:47 +0000 (UTC)
IronPort-SDR: ZQ4ORUH3zl/d9HCGwM6pVdrzqLHFIn7Il8NW+A5oM1iBCiIoaRd3PjX3t08zZh5lA6cHlw8mM+
 3h7ADKTQG3Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="135960673"
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="135960673"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 19:11:46 -0700
IronPort-SDR: 9NjUpd+YjYPydnz78S631g5TyybmpyA9HfJmR8+sUT1YXVleW1KorRBhS3nAGU35G6NSN5j5NP
 f8CGEd3cQDdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="457322804"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2020 19:11:42 -0700
Subject: Re: [PATCH v4 1/5] docs: IOMMU user API
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Alex Williamson <alex.williamson@redhat.com>
References: <1594165429-20075-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594165429-20075-2-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <6d01dac0-aa9d-e22b-9baf-28c2f538871a@linux.intel.com>
Date: Wed, 8 Jul 2020 10:07:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1594165429-20075-2-git-send-email-jacob.jun.pan@linux.intel.com>
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

Hi,

On 7/8/20 7:43 AM, Jacob Pan wrote:
> +For UAPIs that are shared with in-kernel users, a wrapper function
> +is provided to distinguish the callers. For example,
> +
> +Userspace caller ::
> +
> +  int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> +  void __user *udata)
> +
> +In-kernel caller ::
> +
> +  int __iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> +  struct iommu_gpasid_bind_data *data)

iommu_page_response() may have the same needs. Can we reach an agreement
on the naming rules?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
