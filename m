Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D827BC71
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 07:28:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4495E204FF;
	Tue, 29 Sep 2020 05:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZMp4IggttCa; Tue, 29 Sep 2020 05:28:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 53EC42046A;
	Tue, 29 Sep 2020 05:28:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CFFC0051;
	Tue, 29 Sep 2020 05:28:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67E1AC0051
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 05:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 52E9820481
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 05:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12aS7jS4xLdw for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 05:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 38D802046A
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 05:28:52 +0000 (UTC)
IronPort-SDR: lq/AIa+s5YsV1rnwz5iKIdhDmeZH+1akd2PNQA9S5LLmv3fuIuM8vF0jWMwoAmfv0ie/9WNQAy
 2QbVR0cwolKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226263187"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="226263187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 22:28:50 -0700
IronPort-SDR: d9oPvLNhVZEmQrvhaHfWvzfDnd69GSsCde7vn8tKZXXDlWtSFGOfBY1v4BByLZJd6kferU2YSR
 AIkbsbmxwzAQ==
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="489059027"
Received: from brdaguma-mobl.amr.corp.intel.com (HELO araj-mobl1.jf.intel.com)
 ([10.254.89.207])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 22:28:50 -0700
Date: Mon, 28 Sep 2020 22:28:48 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH V7 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20200929052848.GA26906@araj-mobl1.jf.intel.com>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
 <20200924172148.GA85236@otc-nc-03>
 <20200925073423.GT27174@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925073423.GT27174@8bytes.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi Joerg

On Fri, Sep 25, 2020 at 09:34:23AM +0200, Joerg Roedel wrote:
> Hi Ashok,
> 
> On Thu, Sep 24, 2020 at 10:21:48AM -0700, Raj, Ashok wrote:
> > Just trying to followup on this series.
> > 
> > Sai has moved out of Intel, hence I'm trying to followup on his behalf.
> > 
> > Let me know if you have queued this for the next release.
> 
> Not yet, but I think this is mostly ready. Can you please send a new
> version in a new mail thread so that I can pick it up with b4?

I reposted Sai's patches again here. 

https://lore.kernel.org/linux-iommu/20200925190620.18732-2-ashok.raj@intel.com/

Can you let me know if they are in a format you can pickup> via b4? 

With recent issues we have sending mails out of Intel, wanted to make sure everything
made it out in one piece.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
