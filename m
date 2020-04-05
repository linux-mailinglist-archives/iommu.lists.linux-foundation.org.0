Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8719E9EA
	for <lists.iommu@lfdr.de>; Sun,  5 Apr 2020 10:29:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 813FC86840;
	Sun,  5 Apr 2020 08:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efoPzE2lcKfE; Sun,  5 Apr 2020 08:29:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E72DD8683C;
	Sun,  5 Apr 2020 08:29:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1BF0C0177;
	Sun,  5 Apr 2020 08:29:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40F1AC0177
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C9E685F55
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVsEhKtcoi4E for <iommu@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:29:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0735D85E83
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:29:02 +0000 (UTC)
IronPort-SDR: stb2jyxELnWxsewW4WMJiCII+FzsZKdbcC4obqlmwq4+Kh0aHtaBiMii8FTGSePm6zzaqQW9hH
 p72PPq2ZBP+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 01:29:01 -0700
IronPort-SDR: GkUrYhcg8R10oY7HouQeSWq86gskBmAKtRVzlu7JTmWrleeYOaNI9ekVbKxltV+umcdu350aRE
 jyf84Nixzyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,347,1580803200"; d="scan'208";a="243222375"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.208.154])
 ([10.254.208.154])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2020 01:28:58 -0700
Subject: Re: [PATCH v11 00/10] Nested Shared Virtual Address (SVA) VT-d support
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <a1eed4ed-7ad7-a445-7e5c-a5eb1771587c@linux.intel.com>
Date: Sun, 5 Apr 2020 16:28:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On 2020/4/4 2:42, Jacob Pan wrote:
> Shared virtual address (SVA), a.k.a, Shared virtual memory (SVM) on Intel
> platforms allow address space sharing between device DMA and applications.
> SVA can reduce programming complexity and enhance security.
> This series is intended to enable SVA virtualization, i.e. enable use of SVA
> within a guest user application.
> 
> This is the remaining portion of the original patchset that is based on
> Joerg's x86/vt-d branch. The preparatory and cleanup patches are merged here.
> (git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git)

With Eric's reviewed-by added, all patches in this series have been
piled up for v5.7.

Thank you all!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
