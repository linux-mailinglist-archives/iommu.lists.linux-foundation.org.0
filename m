Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B38260E4F
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 11:07:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7A6C86930;
	Tue,  8 Sep 2020 09:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2WxgtcBJM20; Tue,  8 Sep 2020 09:07:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D9CB8692E;
	Tue,  8 Sep 2020 09:07:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0899CC0052;
	Tue,  8 Sep 2020 09:07:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08AF5C0052
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E6777868FE
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpuDRjNdYIne for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 09:07:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 55524868F9
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:07:48 +0000 (UTC)
IronPort-SDR: ETWdnZqCvVlRXrZKav9GdgOr1nIQwMFjdGFiBch1MD80sE7clYgughLHCuH2xu42TdjhjSW+At
 hja6qFw4lWaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="222307623"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="222307623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:07:47 -0700
IronPort-SDR: rHwojlhVW0dFkc/kb3riPBbvzthmB+nEUSNIYk5lH7YGRccxAgSKkZK7TtpFoIs7UrFOOSmafa
 FIbPT+cfnJ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="299721582"
Received: from shiche4x-mobl.gar.corp.intel.com (HELO [10.254.211.164])
 ([10.254.211.164])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2020 02:07:44 -0700
Subject: Re: [PATCH V2 5/5] DO NOT MERGE: iommu: disable list appending in
 dma-iommu
To: Christoph Hellwig <hch@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
 <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
 <20200908053619.GA15418@infradead.org> <20200908055510.GA19078@infradead.org>
 <9655fdc9-6ea0-e4c1-e104-a9a8981ecb1e@linux.intel.com>
 <20200908062326.GB20774@infradead.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <fd4aef77-4ec6-da94-8508-49b1a21143dd@linux.intel.com>
Date: Tue, 8 Sep 2020 17:07:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908062326.GB20774@infradead.org>
Content-Language: en-US
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, iommu@lists.linux-foundation.org,
 Tom Murphy <murphyt7@tcd.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020/9/8 14:23, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 02:04:53PM +0800, Lu Baolu wrote:
>> Do you mind telling where can I find Marek's series?
> 
> [PATCH v10 00/30] DRM: fix struct sg_table nents vs. orig_nents misuse
> 
> on various lists including the iommu one.
> 

Get it. Thank you!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
