Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9910E486
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 03:24:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE82786439;
	Mon,  2 Dec 2019 02:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Isffnr+EPKDR; Mon,  2 Dec 2019 02:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42417863A8;
	Mon,  2 Dec 2019 02:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 259F3C087F;
	Mon,  2 Dec 2019 02:24:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25102C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 02:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1391986439
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 02:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zee-hQi8x6uI for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 02:24:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 80F25863A8
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 02:24:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 18:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,267,1571727600"; d="scan'208";a="222260750"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 01 Dec 2019 18:24:09 -0800
Subject: Re: kernel BUG at drivers/iommu/intel-iommu.c:667!
To: Anand Misra <am.online.edu@gmail.com>, iommu@lists.linux-foundation.org
References: <CAL20ACJ2cM1Zs3q5rb3jG7fDVNfzySV6WX=+nbdKiS4KT52NaQ@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f0913338-3854-6ff7-aa8c-85b96efbed27@linux.intel.com>
Date: Mon, 2 Dec 2019 10:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAL20ACJ2cM1Zs3q5rb3jG7fDVNfzySV6WX=+nbdKiS4KT52NaQ@mail.gmail.com>
Content-Language: en-US
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

Hi,

On 12/2/19 9:46 AM, Anand Misra wrote:
> Hello:
> 
> I'm in process of adding iommu support in my driver for a PCIe device. 
> The device doesn't publish ACS/ATS via its config space. I've following 
> config:
> 
> Linux cmdline: "intel-iommu=on iommu=pt 
> vfio_iommu_type1.allow_unsafe_interrupts=1 pcie_acs_override=downstream"
> Centos kernel: 3.10.0-1062.1.2.el7.x86_64
> 

Can you please use the latest kernel for test? 3.10 seems to be pretty
old and there are a lot of changes after it.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
