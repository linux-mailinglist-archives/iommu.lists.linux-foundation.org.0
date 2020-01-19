Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 63679141B10
	for <lists.iommu@lfdr.de>; Sun, 19 Jan 2020 02:54:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED5EE8452E;
	Sun, 19 Jan 2020 01:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbcSK09oqMLj; Sun, 19 Jan 2020 01:54:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 236CD84559;
	Sun, 19 Jan 2020 01:54:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D3DDC077D;
	Sun, 19 Jan 2020 01:54:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CEA8C077D
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 01:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5598786D73
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 01:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BnZSIvXDB2j for <iommu@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 01:54:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1487186CDC
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 01:54:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 17:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="214894039"
Received: from allen-box.sh.intel.com (HELO [10.239.159.138])
 ([10.239.159.138])
 by orsmga007.jf.intel.com with ESMTP; 18 Jan 2020 17:54:34 -0800
Subject: Re: intel iommu pasid question
To: =?UTF-8?B?5ZGo5YWJ6L+q?= <zhouguangdi@cambricon.com>,
 iommu@lists.linux-foundation.org
References: <2419db41.2662.16fb6dfed52.Coremail.zhouguangdi@cambricon.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b1495d7f-e15a-780d-8ef5-2838a7bf2ef1@linux.intel.com>
Date: Sun, 19 Jan 2020 09:53:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2419db41.2662.16fb6dfed52.Coremail.zhouguangdi@cambricon.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgR3VhbmdkaSwKCk9uIDEvMTgvMjAgMTI6MTggUE0sIOWRqOWFiei/qiB3cm90ZToKPiBIaSBh
bGzvvIwKPiAKPiAKPiBJIGFtIGN1cnJlbnRseSBkZXZlbG9waW5nIGEgcGNpZSBkZXZpY2UgZHJp
dmVyIG9uIExpbnV4IGtlcm5lbCA0LjQgb3IKPiBsYXRlci4gSSB3YW50IHRvIHVzZSBwYXNpZCB0
byBkaXJlY3RseSBhY2Nlc3MgdXNlci1tb2RlIG1lbW9yeS4gQnV0IEkKPiBmb3VuZCB0aGF0IHRo
ZSBpb21tdSBvZiBteSBkZXZlbG9wbWVudCBtYWNoaW5lIGRvZXMgbm90IHN1cHBvcnQgCj4gcGFz
aWQucGFzaWRfZW5hYmxlZChpb21tdSkgb3IgcGFzaWRfc3VwcG9ydGVkKGlvbW11KSByZXR1cm4g
ZmFsc2UuCgpJbnRlbCBJT01NVSBkcml2ZXIgY3VycmVudGx5IHN1cHBvcnRzIFNWQSB0aHJvdWdo
IEFQSXMgZGVmaW5lZCBpbgppbmNsdWRlL2xpbnV4L2ludGVsLXN2bS5oLiBXZSBhcmUgc3dpdGNo
aW5nIHRvIHVzZSB0aGUgQVBJcyBkZWZpbmVkCmluIGRyaXZlci9pb21tdS9pb21tdS5jLCBidXQg
aXQgc2hvdWxkIGxhc3QgZm9yIHNvbWUgd2hpbGUuCgpCZXN0IHJlZ2FyZHMsCmJhb2x1Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
