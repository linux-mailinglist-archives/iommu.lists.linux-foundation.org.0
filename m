Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C6D850A
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 02:48:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0362EAF7;
	Wed, 16 Oct 2019 00:48:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D59AB40B
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 00:48:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FE73821
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 00:48:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 17:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; d="scan'208";a="194683484"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2019 17:48:18 -0700
Subject: Re: [PATCH 0/2] iommu/dmar: expose fault counters via sysfs
To: Yuri Volchkov <volchkov@amazon.de>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20191015151112.17225-1-volchkov@amazon.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <005c9cae-be2a-80a7-6e78-ed535160350a@linux.intel.com>
Date: Wed, 16 Oct 2019 08:45:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015151112.17225-1-volchkov@amazon.de>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bhelgaas@google.com, dwmw2@infradead.org, neugebar@amazon.co.uk
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

On 10/15/19 11:11 PM, Yuri Volchkov wrote:
> For health monitoring, it can be useful to know if iommu is behaving as
> expected. DMAR faults can be an indicator that a device:
>   - has been misconfigured, or
>   - has experienced a hardware hiccup and replacement should
>     be considered, or
>   - has been issuing faults due to malicious activity
> 
> Currently the only way to check if there were any DMAR faults on the
> host is to scan the dmesg output. However this approach is not very
> elegant. The information we are looking for can be wrapped out of the
> buffer, or masked (since it is a rate-limited print) by another
> device.
> 
> The series adds counters for DMAR faults and exposes them via sysfs.
> 

We now have an iommu API named iommu_register_fault_handler() to
register callbacks for dmar faults. How about monitoring the dmar
fault through this api so that your code could be generic and vendor
agnostic?

Best regards,
Baolu

> Yuri Volchkov (2):
>    iommu/dmar: collect fault statistics
>    iommu/dmar: catch early fault occurrences
> 
>   drivers/iommu/dmar.c        | 182 ++++++++++++++++++++++++++++++++----
>   drivers/iommu/intel-iommu.c |   1 +
>   drivers/pci/pci-sysfs.c     |  20 ++++
>   include/linux/intel-iommu.h |   4 +
>   include/linux/pci.h         |  11 +++
>   5 files changed, 201 insertions(+), 17 deletions(-)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
