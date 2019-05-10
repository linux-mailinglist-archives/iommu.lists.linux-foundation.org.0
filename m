Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E119FA2
	for <lists.iommu@lfdr.de>; Fri, 10 May 2019 16:56:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1FE04DBB;
	Fri, 10 May 2019 14:56:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E5A9DB5
	for <iommu@lists.linux-foundation.org>;
	Fri, 10 May 2019 14:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73EB3CF
	for <iommu@lists.linux-foundation.org>;
	Fri, 10 May 2019 14:56:42 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2019 07:56:41 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
	by fmsmga005.fm.intel.com with ESMTP; 10 May 2019 07:56:39 -0700
Received: from andy by smile with local (Exim 4.92)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1hP6ww-0004eI-RD; Fri, 10 May 2019 17:56:38 +0300
Date: Fri, 10 May 2019 17:56:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH 0/3] Add debugfs support to show scalable mode DMAR table
Message-ID: <20190510145638.GB9224@smile.fi.intel.com>
References: <cover.1556762845.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1556762845.git.sai.praneeth.prakhya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Thu, May 09, 2019 at 11:41:42AM -0700, Sai Praneeth Prakhya wrote:
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

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since it's debugfs the format is not carved in stone.

> 
> Sai Praneeth (3):
>   iommu/vt-d: Modify the format of intel DMAR tables dump
>   iommu/vt-d: Introduce macros useful for dumping DMAR table
>   iommu/vt-d: Add debugfs support to show scalable mode DMAR table
>     internals
> 
>  drivers/iommu/intel-iommu-debugfs.c | 132 +++++++++++++++++++++++++++++-------
>  drivers/iommu/intel-pasid.c         |  17 -----
>  drivers/iommu/intel-pasid.h         |  26 +++++++
>  3 files changed, 134 insertions(+), 41 deletions(-)
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
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
