Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD6196B9
	for <lists.iommu@lfdr.de>; Fri, 10 May 2019 04:37:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59CACB9E;
	Fri, 10 May 2019 02:37:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8732CB9E
	for <iommu@lists.linux-foundation.org>;
	Fri, 10 May 2019 02:37:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EAECA709
	for <iommu@lists.linux-foundation.org>;
	Fri, 10 May 2019 02:37:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2019 19:37:15 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga008.fm.intel.com with ESMTP; 09 May 2019 19:37:14 -0700
Subject: Re: [PATCH 0/3] Add debugfs support to show scalable mode DMAR table
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
	iommu@lists.linux-foundation.org
References: <cover.1556762845.git.sai.praneeth.prakhya@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <fa685d9b-eab3-4411-0e1c-79a3fb4087fd@linux.intel.com>
Date: Fri, 10 May 2019 10:30:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1556762845.git.sai.praneeth.prakhya@intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
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

Hi Sai,

On 5/10/19 2:41 AM, Sai Praneeth Prakhya wrote:
> From: Sai Praneeth <sai.praneeth.prakhya@intel.com>
> 
> Presently, "/sys/kernel/debug/iommu/intel/dmar_translation_struct" file dumps
> only legacy DMAR table which consists of root table and context table. Scalable
> mode DMAR table adds PASID directory and PASID table. Hence, add support to dump
> these tables as well.
> 
> Directly extending the present dumping format for PASID tables will make the
> output look clumsy. Hence, the first patch modifies the present format to a
> tabular format. The second patch introduces macros that are used during PASID
> table walk and the third patch actually adds support to dump scalable mode DMAR
> table.
> 
> Sai Praneeth (3):
>    iommu/vt-d: Modify the format of intel DMAR tables dump
>    iommu/vt-d: Introduce macros useful for dumping DMAR table
>    iommu/vt-d: Add debugfs support to show scalable mode DMAR table
>      internals

This patch set looks good to me in general. One minor suggestion is that
the author name and signed-of-by name should be consistent for all
patches.

Best regards,
Lu Baolu

> 
>   drivers/iommu/intel-iommu-debugfs.c | 132 +++++++++++++++++++++++++++++-------
>   drivers/iommu/intel-pasid.c         |  17 -----
>   drivers/iommu/intel-pasid.h         |  26 +++++++
>   3 files changed, 134 insertions(+), 41 deletions(-)
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Sohil Mehta <sohil.mehta@intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
