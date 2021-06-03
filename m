Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B50399850
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 04:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03EBC404E7;
	Thu,  3 Jun 2021 02:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0mkcUGlCZC3; Thu,  3 Jun 2021 02:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F11A400D8;
	Thu,  3 Jun 2021 02:56:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02A5AC0024;
	Thu,  3 Jun 2021 02:56:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E001DC0001;
 Thu,  3 Jun 2021 02:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C16CD400D8;
 Thu,  3 Jun 2021 02:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7tDOqJw_ECv; Thu,  3 Jun 2021 02:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3365B400B8;
 Thu,  3 Jun 2021 02:56:48 +0000 (UTC)
IronPort-SDR: ayEEZz93ETXZVs+ZtSqH+Qcu0b8ofCoX7r7nNzV+0cHRPbBuuxjEPTT5e03I+HfUS6FpLx8sLS
 EdwU8IWGHryw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="191061483"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="191061483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 19:56:48 -0700
IronPort-SDR: KhRXtgngnmgKjM5HGekGuKCGTxqbA99N9UtERxN/h391vZaKc5WUL0tyOCjFA2/qjOiV0+JkOX
 pLjDWqoLDQ8g==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="550535335"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.87.193])
 ([10.209.87.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 19:56:47 -0700
Subject: Re: [PATCH v1 1/8] virtio: Force only split mode with protected guest
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20210603004133.4079390-1-ak@linux.intel.com>
 <20210603004133.4079390-2-ak@linux.intel.com>
 <28c8302b-6833-10b4-c0eb-67456e7c4069@redhat.com>
 <09e17c7f-ce51-1a46-72c4-12223bee4e3a@linux.intel.com>
 <1c08bc42-7448-351e-78bf-fcf68d2b2561@redhat.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <5a2d0d70-fa6b-f08d-f222-5c00cf5f9d44@linux.intel.com>
Date: Wed, 2 Jun 2021 19:56:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1c08bc42-7448-351e-78bf-fcf68d2b2561@redhat.com>
Content-Language: en-US
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 jpoimboe@redhat.com, robin.murphy@arm.com, hch@lst.de
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


>
> I agree, but I want to know why indirect descriptor needs to be 
> disabled. The table can't be wrote by the device since it's not 
> coherent swiotlb mapping.

I had all kinds of problems with uninitialized entries in the indirect 
table. So I gave up on it and concluded it would be too difficult to secure.


-Andi


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
