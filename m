Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054B144B63
	for <lists.iommu@lfdr.de>; Wed, 22 Jan 2020 06:41:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AF0C865CF;
	Wed, 22 Jan 2020 05:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63OTuWKKQhfq; Wed, 22 Jan 2020 05:41:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57495863FD;
	Wed, 22 Jan 2020 05:41:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E34C0174;
	Wed, 22 Jan 2020 05:41:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F75DC0174
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 78A4587AF3
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tukJiY4dLvjV for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 05:40:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A90E087AB5
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:40:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 21:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="215791760"
Received: from allen-box.sh.intel.com (HELO [10.239.159.138])
 ([10.239.159.138])
 by orsmga007.jf.intel.com with ESMTP; 21 Jan 2020 21:40:55 -0800
Subject: Re: [RFC PATCH 3/4] iommu: Preallocate iommu group when probing
 devices
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
References: <20200101052648.14295-1-baolu.lu@linux.intel.com>
 <20200101052648.14295-4-baolu.lu@linux.intel.com>
 <20200117102151.GF15760@8bytes.org>
 <25e2e7fa-487c-f951-4b2c-27bac5e30815@linux.intel.com>
 <b721d3f7-6292-35d6-a9eb-154d3233dcc0@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f04c590b-d966-88e8-7309-e73b600d4e9f@linux.intel.com>
Date: Wed, 22 Jan 2020 13:39:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b721d3f7-6292-35d6-a9eb-154d3233dcc0@arm.com>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
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

SGkgUm9iaW4sCgpPbiAxLzIxLzIwIDg6NDUgUE0sIFJvYmluIE11cnBoeSB3cm90ZToKPiBPbiAx
OS8wMS8yMDIwIDY6MjkgYW0sIEx1IEJhb2x1IHdyb3RlOgo+PiBIaSBKb2VyZywKPj4KPj4gT24g
MS8xNy8yMCA2OjIxIFBNLCBKb2VyZyBSb2VkZWwgd3JvdGU6Cj4+PiBPbiBXZWQsIEphbiAwMSwg
MjAyMCBhdCAwMToyNjo0N1BNICswODAwLCBMdSBCYW9sdSB3cm90ZToKPj4+PiBUaGlzIHNwbGl0
cyBpb21tdSBncm91cCBhbGxvY2F0aW9uIGZyb20gYWRkaW5nIGRldmljZXMuIFRoaXMgbWFrZXMK
Pj4+PiBpdCBwb3NzaWJsZSB0byBkZXRlcm1pbmUgdGhlIGRlZmF1bHQgZG9tYWluIHR5cGUgZm9y
IGVhY2ggZ3JvdXAgYXMKPj4+PiBhbGwgZGV2aWNlcyBiZWxvbmdpbmcgdG8gdGhlIGdyb3VwIGhh
dmUgYmVlbiBkZXRlcm1pbmVkLgo+Pj4KPj4+IEkgdGhpbmsgaXRzIGJldHRlciB0byBrZWVwIGdy
b3VwIGFsbG9jYXRpb24gYXMgaXQgaXMgYW5kIGp1c3QgZGVmZXIKPj4+IGRlZmF1bHQgZG9tYWlu
IGFsbG9jYXRpb24gYWZ0ZXIgZWFjaCBkZXZpY2UgaXMgaW4gaXRzIGdyb3VwLiBCdXQgdGFrZQo+
Pgo+PiBJIHRyaWVkIGRlZmVyaW5nIGRlZmF1bHQgZG9tYWluIGFsbG9jYXRpb24sIGJ1dCBpdCBz
ZWVtcyBub3QgcG9zc2libGUuCj4+Cj4+IFRoZSBjYWxsIHBhdGggb2YgYWRkaW5nIGRldmljZXMg
aW50byB0aGVpciBncm91cHM6Cj4+Cj4+IGlvbW11X3Byb2JlX2RldmljZQo+PiAtPiBvcHMtPmFk
ZF9kZXZpY2UoZGV2KQo+PiDCoMKgwqAgLT4gKGlvbW11IHZlbmRvciBkcml2ZXIpIGlvbW11X2dy
b3VwX2dldF9mb3JfZGV2KGRldikKPj4KPj4gQWZ0ZXIgZG9pbmcgdGhpcywgdGhlIHZlbmRvciBk
cml2ZXIgd2lsbCBnZXQgdGhlIGRlZmF1bHQgZG9tYWluIGFuZAo+PiBhcHBseSBkbWFfb3BzIGFj
Y29yZGluZyB0byB0aGUgZG9tYWluIHR5cGUuIElmIHdlIGRlZmVyIHRoZSBkb21haW4KPj4gYWxs
b2NhdGlvbiwgdGhleSB3aWxsIGdldCBhIE5VTEwgZGVmYXVsdCBkb21haW4gYW5kIGNhdXNlIHBh
bmljIGluCj4+IHRoZSB2ZW5kb3IgZHJpdmVyLgo+Pgo+PiBBbnkgc3VnZ2VzdGlvbnM/Cj4gCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvNmRiYmZjMTAtMzI0Ny03NDRjLWFl
OGQtNDQzYTMzNmUwYzUwQGxpbnV4LmludGVsLmNvbS8gCj4gCj4gCj4gSGF2ZW4ndCB3ZSBiZWVu
IGhlcmUgYmVmb3JlPyA7KQo+IAo+IFNpbmNlIHdlIGNhbid0IChzYWZlbHkgb3IgcmVhc29uYWJs
eSkgY2hhbmdlIGEgZ3JvdXAncyBkZWZhdWx0IGRvbWFpbiAKPiBhZnRlciBvcHMtPmFkZF9kZXZp
Y2UoKSBoYXMgcmV0dXJuZWQsIGFuZCBpbiBnZW5lcmFsIGl0IGdldHMgaW1wcmFjdGljYWwgCj4g
dG8gZXZhbHVhdGUgImFsbCBkZXZpY2UgaW4gYSBncm91cCIgb25jZSB5b3UgbG9vayBiZXlvbmQg
JnBjaV9idXNfdHlwZSAKPiAob3IgY29uc2lkZXIgaG90cGx1ZyBhcyBtZW50aW9uZWQpLCB0aGVu
IEFGQUlDUyB0aGVyZSdzIG5vIHJlYXNvbmFibGUgCj4gd2F5IHRvIGdldCBhd2F5IGZyb20gdGhl
IGRlZmF1bHQgZG9tYWluIHR5cGUgYmVpbmcgZGVmaW5lZCBieSB0aGUgZmlyc3QgCj4gZGV2aWNl
IHRvIGF0dGFjaC4KClllcywgYWdyZWVkLgoKPiBCdXQgaW4gcHJhY3RpY2UgaXQncyBoYXJkbHkg
YSBwcm9ibGVtIGFueXdheSAtIGlmIAo+IGV2ZXJ5IGRldmljZSBpbiBhIGdpdmVuIGdyb3VwIHJl
cXVlc3RzIHRoZSBzYW1lIGRvbWFpbiB0eXBlIHRoZW4gaXQgCj4gZG9lc24ndCBtYXR0ZXIgd2hp
Y2ggY29tZXMgZmlyc3QsIGFuZCBpZiB0aGV5IGRvbid0IHRoZW4gd2UgdWx0aW1hdGVseSAKPiBl
bmQgdXAgd2l0aCBhbiBpbXBvc3NpYmxlIHNldCBvZiBjb25zdHJhaW50cywgc28gYXJlIGRvb21l
ZCB0byBkbyB0aGUgCj4gJ3dyb25nJyB0aGluZyByZWdhcmRsZXNzLgoKVGhlIHRoaXJkIGNhc2Ug
aXMsIGZvciBleGFtcGxlLCB0aHJlZSBkZXZpY2VzIEEsIEIsIEMgaW4gYSBncm91cC4gVGhlCmZp
cnN0IGRldmljZSBBIGlzIG5ldXRyYWwgYWJvdXQgd2hpY2ggdHlwZSBvZiBkZWZhdWx0IGRvbWFp
biB0eXBlIGlzCnVzZWQuIFNvIHRoZSBpb21tdSBmcmFtZXdvcmsgd2lsbCB1c2UgYSBzdGF0aWMg
ZGVmYXVsdCBkb21haW4uIEJ1dCB0aGUKZGV2aWNlIEIgcmVxdWlyZXMgdG8gdXNlIGEgc3BlY2lm
aWMgb25lIHdoaWNoIGlzIGRpZmZlcmVudCBmcm9tIHRoZQpkZWZhdWx0LiBDdXJyZW50bHksIHRo
aXMgaXMgaGFuZGxlZCBpbiB0aGUgdmVuZG9yIGlvbW11IGRyaXZlciBhbmQgb25lCm1vdGl2YXRp
b24gb2YgdGhpcyBwYXRjaCBzZXQgaXMgdG8gaGFuZGxlIHRoaXMgaW4gdGhlIGdlbmVyaWMgbGF5
ZXIuCgo+IAo+IFRodXMgdW5sZXNzIGFueW9uZSB3YW50cyB0byBzdGFydCByZWRlZmluaW5nIHRo
ZSB3aG9sZSBncm91cCBjb25jZXB0IHRvIAo+IHNlcGFyYXRlIHRoZSBub3Rpb25zIG9mIElEIGFs
aWFzaW5nIGFuZCBwZWVyLXRvLXBlZXIgaXNvbGF0aW9uICh3aGljaCAKPiBzdGlsbCB3b3VsZG4n
dCBuZWNlc3NhcmlseSBoZWxwKSwgSSB0aGluayB0aGlzIHVzZXIgb3ZlcnJpZGUgZWZmZWN0aXZl
bHkgCj4gYm9pbHMgZG93biB0byBqdXN0IGFub3RoZXIgZmxhdm91ciBvZiBpb21tdV9yZXF1ZXN0
XypfZm9yX2RldigpLCBhbmQgYXMgCj4gc3VjaCBjb21lcyByaWdodCBiYWNrIHRvIHRoZSAianVz
dCBwYXNzIHRoZSBibG9vZHkgZGV2aWNlIHRvIAo+IG9wcy0+ZG9tYWluX2FsbG9jKCkgYW5kIHJl
c29sdmUgZXZlcnl0aGluZyB1cC1mcm9udCIgYXJndW1lbnQuCj4gCj4gUm9iaW4uCgpCZXN0IHJl
Z2FyZHMsCmJhb2x1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
