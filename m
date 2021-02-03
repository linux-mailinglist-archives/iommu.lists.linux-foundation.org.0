Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 274D430D64E
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 10:29:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 913DA204F3;
	Wed,  3 Feb 2021 09:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpsda50+hCze; Wed,  3 Feb 2021 09:29:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55C43204ED;
	Wed,  3 Feb 2021 09:29:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A4C9C013A;
	Wed,  3 Feb 2021 09:29:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8AEEC013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C8140870BD
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5raiJiQ5Hg3n for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 09:29:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2CB2887090
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:29:41 +0000 (UTC)
IronPort-SDR: 95yS9f0cn/IB3E5LOWqua0DnIlTEzchCQdStx+DMyfMugdh+cRN+48smwc2aAjUsEJ/ZGnDw6s
 FWXNp6QFU1lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="160773973"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="160773973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 01:29:40 -0800
IronPort-SDR: KJ4lPYHXMdgVlZDMopX9R1W9FxG2zKCK7WQjxWzNe5xTjj0hgL6ICLr74GV11Dy7omu2s2mCZm
 RvnaXcSvfKAw==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="371352426"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.211])
 ([10.254.210.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 01:29:38 -0800
Subject: Re: [PATCH 0/3] iommu/vt-d: Add support for ACPI/SATC table
To: Christoph Hellwig <hch@infradead.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210203084128.GA3916610@infradead.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <18fc34e2-18db-d6f8-1011-a2cb8df85ed5@linux.intel.com>
Date: Wed, 3 Feb 2021 17:29:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203084128.GA3916610@infradead.org>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

Hi Christoph,

On 2021/2/3 16:41, Christoph Hellwig wrote:
> On Tue, Feb 02, 2021 at 12:40:54PM +0800, Lu Baolu wrote:
>> Intel platform VT-d (v3.2) comes with a new type of DMAR subtable
>> SATC. The SATC table includes a list of SoC integrated devices
>> that require SATC. OS software can use this table to enable ATS
>> only for the devices in the list.
> 
> This all sounds like gibberish. Please expand and if necessary explain
> acronyms when first used in each commit log / cover letter.
> 

I will rephrase the words.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
