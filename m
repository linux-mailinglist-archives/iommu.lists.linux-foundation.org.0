Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C62B00F0
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 09:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F89C86D6E;
	Thu, 12 Nov 2020 08:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibVoHYtMuFof; Thu, 12 Nov 2020 08:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4318E8587C;
	Thu, 12 Nov 2020 08:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BBCFC1AD8;
	Thu, 12 Nov 2020 08:13:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F03DBC016F
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 08:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D6E4D8767D
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 08:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jm0+0Esq-vIP for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 08:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5C888767C
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 08:13:13 +0000 (UTC)
IronPort-SDR: pi5U3xgUsYEiwawAn5MZ3QJYbf3nd9conp/8lV0fpjJGIf/HpswVoBlOkHa2hU3vyQPbvLq0Cw
 PaGLd4IYXhIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="188268191"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; d="scan'208";a="188268191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 00:13:13 -0800
IronPort-SDR: auzE3zXNjb4nbrvoPOgodklDPlWISs6bE+3e/oxck2ZR6mnWbiyMT886fkwAgH3KDZQgc7L7t0
 gSmYV2lX8M+w==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; d="scan'208";a="542165910"
Received: from kszypryt-mobl1.ger.corp.intel.com (HELO
 lhawrylk-desk.ger.corp.intel.com) ([10.213.18.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 00:13:09 -0800
Message-ID: <b52b65eed026b56090bd36533366e54cbc9ff689.camel@linux.intel.com>
Subject: Re: [PATCH v2] iommu/vt-d: avoid unnecessory panic if iommu init
 fail in tboot system
From: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>, linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2020 09:13:06 +0100
In-Reply-To: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
References: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: x86@kernel.org, tboot-devel@lists.sourceforge.net, ning.sun@intel.com,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 tglx@linutronix.de, dwmw2@infradead.org
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

On Tue, 2020-11-10 at 15:19 +0800, Zhenzhong Duan wrote:
> "intel_iommu=off" command line is used to disable iommu but iommu is force
> enabled in a tboot system for security reason.
> 
> However for better performance on high speed network device, a new option
> "intel_iommu=tboot_noforce" is introduced to disable the force on.
> 
> By default kernel should panic if iommu init fail in tboot for security
> reason, but it's unnecessory if we use "intel_iommu=tboot_noforce,off".
> 
> Fix the code setting force_on and move intel_iommu_tboot_noforce
> from tboot code to intel iommu code.
> 
> Fixes: 7304e8f28bb2 ("iommu/vt-d: Correctly disable Intel IOMMU force on")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
> ---
> v2: move ckeck of intel_iommu_tboot_noforce into iommu code per Baolu.
> 

Tested-by: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
