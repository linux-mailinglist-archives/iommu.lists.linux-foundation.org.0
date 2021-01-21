Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4EF2FE9D7
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 13:21:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7D2586C55;
	Thu, 21 Jan 2021 12:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3Jbjnmqkx6j; Thu, 21 Jan 2021 12:21:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3695C86C11;
	Thu, 21 Jan 2021 12:21:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AF36C013A;
	Thu, 21 Jan 2021 12:21:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6177C013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 12:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8003821505
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 12:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQBl3jFpjHm4 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 12:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A4D22049F
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdNOWiSvpp1h1FQ1yCUgYu+uACMYKqVEBGPORZ+jdtY=;
 b=ENZwl9a9rUiP+YnNq7bBmZY/LFIX7XeFyWQ09bhL9wItUXHtzLR83RfY6EypqomYlFawxo
 glY4JSA57ancEw7ZuufcsJRy2sRlFuVKq1krd/Z2L9PiVdaTEh5QwP/dbrJhBJ6zWCkpPl
 sb15Q2B2mgmUP1nBJzjQKzB/TxUt1sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-gVia8A6FOX638Qz587PhRw-1; Thu, 21 Jan 2021 07:21:19 -0500
X-MC-Unique: gVia8A6FOX638Qz587PhRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAD628144E0;
 Thu, 21 Jan 2021 12:21:17 +0000 (UTC)
Received: from [10.72.12.73] (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB4060BF3;
 Thu, 21 Jan 2021 12:21:15 +0000 (UTC)
Subject: Re: [PATCH 1/2 v2] dma-iommu: use static-key to minimize the impact
 in the fast-path
To: Christoph Hellwig <hch@infradead.org>
References: <20210119111616.12761-1-lijiang@redhat.com>
 <20210119111616.12761-2-lijiang@redhat.com>
 <20210119152641.GA3453587@infradead.org>
From: lijiang <lijiang@redhat.com>
Message-ID: <fcddfd41-19b5-1a56-8c64-ea9ce851030d@redhat.com>
Date: Thu, 21 Jan 2021 20:21:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210119152641.GA3453587@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGksIENocmlzdG9waAoKVGhhbmtzIGZvciB0aGUgY29tbWVudC4K5ZyoIDIwMjHlubQwMeaciDE5
5pelIDIzOjI2LCBDaHJpc3RvcGggSGVsbHdpZyDlhpnpgZM6Cj4gT24gVHVlLCBKYW4gMTksIDIw
MjEgYXQgMDc6MTY6MTVQTSArMDgwMCwgTGlhbmJvIEppYW5nIHdyb3RlOgo+PiArc3RhdGljIERF
RklORV9TVEFUSUNfS0VZX0ZBTFNFKF9fZGVmZXJyZWRfYXR0YWNoKTsKPiBXaHkgdGhlIHN0cmFu
Z2UgdW5kZXJzY29yZXM/ICBXb3VsZG4ndCBpb21tdV9kZWZlcnJlZF9hdHRhY2hfZW5hYmxlZAoK
VGhlIHZhcmlhYmxlIGlzIGRlZmluZWQgd2l0aCB0aGUgc3RhdGljIGtleXdvcmQsIHdoaWNoIGlu
ZGljYXRlcyB0aGF0IHRoZQp2YXJpYWJsZSBpcyBvbmx5IHVzZWQgaW4gdGhlIGxvY2FsIG1vZHVs
ZShmaWxlKSwgYW5kIGdpdmVzIGEgaGludCBleHBsaWNpdGx5CndpdGggdGhlIHVuZGVyc2NvcmUg
cHJlZml4LiBBbnl3YXksIHRoaXMgaXMgbXkgcGVyc29uYWwgb3Bpbmlvbi4KCj4gYmUgYSBiZXR0
ZXIgbmFtZT8KPiAKSXQgY291bGQgYmUgYSBsb25nIG5hbWU/CgpUaGFua3MuCkxpYW5ibwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGlu
ZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
