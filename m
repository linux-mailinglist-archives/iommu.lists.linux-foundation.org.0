Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C734F013
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 19:49:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FC060844;
	Tue, 30 Mar 2021 17:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBen5sMSsHJF; Tue, 30 Mar 2021 17:49:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2553E60764;
	Tue, 30 Mar 2021 17:49:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C14DC000A;
	Tue, 30 Mar 2021 17:49:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 723DDC000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 17:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60622404CC
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 17:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VA-l2Ou1soD3 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 17:49:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80057404BB
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 17:49:32 +0000 (UTC)
IronPort-SDR: pZzvUl7PRpWSt6MBTj3QIlIuxyxQ5DslUGKOxsOMMlRwlOZp8H1dUNeua0bf1HZhtZmBR+HyUd
 VUYKE8kZ9HPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="276997592"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="276997592"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 10:49:30 -0700
IronPort-SDR: FKvLAxU7/mf8+wi6h4BaZT9P8YOdspJgTsnJqqPxQyxc4VzrRXVhYEv6CxKxIvTfM2cRClkXwf
 b6SYPfDpn1+g==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="393695340"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 10:49:30 -0700
Date: Tue, 30 Mar 2021 10:52:00 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/4] iommu/vt-d: Enable write protect for supervisor SVM
Message-ID: <20210330105200.418bc42b@jacob-builder>
In-Reply-To: <20210322175338.GA24424@roeck-us.net>
References: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614680040-1989-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210322175338.GA24424@roeck-us.net>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, "Luck, Tony" <tony.luck@intel.com>,
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

Hi Guenter,

On Mon, 22 Mar 2021 10:53:38 -0700, Guenter Roeck <linux@roeck-us.net>
wrote:

> On Tue, Mar 02, 2021 at 02:13:57AM -0800, Jacob Pan wrote:
> > Write protect bit, when set, inhibits supervisor writes to the read-only
> > pages. In supervisor shared virtual addressing (SVA), where page tables
> > are shared between CPU and DMA, IOMMU PASID entry WPE bit should match
> > CR0.WP bit in the CPU.
> > This patch sets WPE bit for supervisor PASIDs if CR0.WP is set.
> > 
> > Signed-off-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---  
> 
> ia64:defconfig:
> 
> drivers/iommu/intel/pasid.c: In function 'pasid_enable_wpe':
> drivers/iommu/intel/pasid.c:536:22: error: implicit declaration of
> function 'read_cr0' drivers/iommu/intel/pasid.c:539:23: error:
> 'X86_CR0_WP' undeclared
> 
> Maybe it _is_ time to retire ia64 ?

Good catch, sorry for the late reply. I guess otherwise I will have to do
some #ifdef?

There are many basic x86 helpers are missing in ia64.

+Tony

Thanks,

Jacob

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
