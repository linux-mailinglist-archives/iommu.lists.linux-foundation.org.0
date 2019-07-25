Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857D742F1
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 03:41:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD49A1657;
	Thu, 25 Jul 2019 01:41:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 713E61551
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 01:41:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A6ABF1
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 01:41:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 18:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="181303696"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2019 18:41:35 -0700
Subject: Re: [PATCH v2 7/7] iommu/vt-d: Consolidate domain_init() to avoid
	duplication
To: Joerg Roedel <joro@8bytes.org>
References: <20190612002851.17103-1-baolu.lu@linux.intel.com>
	<20190612002851.17103-8-baolu.lu@linux.intel.com>
	<20190718171615.2ed56280@x1.home>
	<f56599a6-77ac-e1ef-4843-51167b1284b3@linux.intel.com>
	<20190719091952.58255c47@x1.home>
	<13294960-c040-c501-c279-aa61d780d25e@linux.intel.com>
	<20190722142238.GA12009@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <db69a425-2ab7-c4e6-80fe-a48069ceef0e@linux.intel.com>
Date: Thu, 25 Jul 2019 09:41:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722142238.GA12009@8bytes.org>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	Alex Williamson <alex.williamson@redhat.com>,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 7/22/19 10:22 PM, Joerg Roedel wrote:
> On Sat, Jul 20, 2019 at 09:15:58AM +0800, Lu Baolu wrote:
>> Okay. I agree wit you. Let's revert this commit first.
> 
> Reverted the patch and queued it to my iommu/fixes branch.

Thank you! Joerg.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
