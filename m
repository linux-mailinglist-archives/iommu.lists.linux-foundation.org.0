Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762425657E
	for <lists.iommu@lfdr.de>; Sat, 29 Aug 2020 08:58:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E39EE203DE;
	Sat, 29 Aug 2020 06:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BknHxeQe7bRf; Sat, 29 Aug 2020 06:58:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8D39D2048E;
	Sat, 29 Aug 2020 06:58:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61EB4C089E;
	Sat, 29 Aug 2020 06:58:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC22DC0051
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E5612878BE
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahWqPta9WPNv for <iommu@lists.linux-foundation.org>;
 Sat, 29 Aug 2020 06:58:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B2B8866DD
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sLynlYVgoTZ12meZp6MtaGodJl2JSiWeTVZScGJYiuw=; b=AB2AwQTVPxzravNGzfj9Y3/6ij
 Wg7TrEagE89aLPOByMIcswRsKGBX703d2tK7JyHlTJ07FHFI21+sksplSEWyHi7nmFrGy2k4/CJ1n
 DJz2bk7ym2DC2QhNj69hqgX+1lPH2qdUJliXq5dfjf4LD76KjgGkGC1NywRObnxEYgzpIkAIuRCvn
 0EsZMJ5oksBC2wpDx0MEMn3KzUAGdH/pM1YkUtIJKbx9754nN4Pp99Dog3pRqvctUZsxg8RdYSLyQ
 xHtlXQSdxFEFTa/tCeflswQA8Nvf/IP+Horkm/Y5WfG3nu6eTOqScyBdl34OdhBAR6Wsf0GHien22
 vJNRTwGQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kBup4-0000Fa-TY; Sat, 29 Aug 2020 06:58:47 +0000
Date: Sat, 29 Aug 2020 07:58:46 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] iommu/vt-d: Move intel_iommu_ops to header file
Message-ID: <20200829065846.GB31681@infradead.org>
References: <20200828160502.65695-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828160502.65695-1-andriy.shevchenko@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Aug 28, 2020 at 07:05:02PM +0300, Andy Shevchenko wrote:
> Compiler is not happy about hidden declaration of intel_iommu_ops.
> 
> .../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
> 
> Move declaration to header file to make compiler happy.

What about a factoring out a helper that does iommu_device_sysfs_add +
iommu_device_set_ops + iommu_device_register and then mark
intel_iommu_ops static?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
