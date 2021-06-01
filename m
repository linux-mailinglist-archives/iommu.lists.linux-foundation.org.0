Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F1396B73
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 04:36:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C41F400A9;
	Tue,  1 Jun 2021 02:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_rjyCyHhIHo; Tue,  1 Jun 2021 02:36:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADF54025D;
	Tue,  1 Jun 2021 02:36:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EAEFC0024;
	Tue,  1 Jun 2021 02:36:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 252C1C0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 02:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 182BE83C6D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 02:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Th0W_7oVsyZM for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 02:36:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF86483C65
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622515011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/vNKwMKD4yXShKjN11l9IaBWHIc+94yjI5sIegf+Rs=;
 b=Cps2Tf85iNTUw08W3cCsEm15YVyVdp1G/XbbBevJUGZ5wZ4VJz5kjniWY0dpC3g6u8EfRp
 7/400m8SJcsuGWznOsiFfYAicL0qCCzPtiHv3VK9QLJobVdMmKeFKc7WJn09JK1OMEfA+D
 PcNoLfMoCa/yAYjWYM3E6F8JUTK4iqM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-CGSmlvTRP0Sq35b1ne4Bzw-1; Mon, 31 May 2021 22:36:47 -0400
X-MC-Unique: CGSmlvTRP0Sq35b1ne4Bzw-1
Received: by mail-pj1-f72.google.com with SMTP id
 v2-20020a17090a9602b029015b0bb8b2b9so1036519pjo.3
 for <iommu@lists.linux-foundation.org>; Mon, 31 May 2021 19:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R/vNKwMKD4yXShKjN11l9IaBWHIc+94yjI5sIegf+Rs=;
 b=pyXhfDLVdiy245AiX4n9K8oyCnirdOhYrIhT1AUt3qO07mOOzQGxek7dyrj1KR1VKj
 ZnQotg2qqNrK6yN++pyxls25X1f9pi/KlNIWgA5VD/3LS+Z/eRTpam6ZaIUyOkrCjEzE
 YLNHVUmUX9ESXyz+JeJ3wfPqiVgI0VZzhGoNAmHHdkCSJe5ZcRDn68A3Q0NhSXnaaQYs
 Zmn5F2Vbd6r2XGATgRxeL7I6VzYTlFdkHVVGi4OX6DtsytCjjz1nAv/JxcrWbw5daFI4
 p7E8YWFpPu5n5aDdj/UQdgHk74uL/cCln0u42WP9+uTMd1tmUor179iUrHgpC/SYc0ti
 hJhQ==
X-Gm-Message-State: AOAM530nuPDWv9hZItnVqmVGCQUXqSjaey78nPae1BD+iAj9AZc02j7X
 eh7Yq05PsHhMgdSnl2oNR993GYmYJ+d5R/JNfEPnR20wqJbH3gZya3M15PnDGQlG2F/CzitV8kn
 PsJsrwzIdib5aTX05Nv9ZboZ8VtojMg==
X-Received: by 2002:a17:90a:588f:: with SMTP id
 j15mr1033515pji.112.1622515006582; 
 Mon, 31 May 2021 19:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPDXYinpNeWXLQoK98eNSiwNXoeGiMTG9/9gXFH9CKUekKLqJYBGdJOueFprZDJGgzAlaU8A==
X-Received: by 2002:a17:90a:588f:: with SMTP id
 j15mr1033494pji.112.1622515006334; 
 Mon, 31 May 2021 19:36:46 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p14sm13530139pgb.2.2021.05.31.19.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 19:36:45 -0700 (PDT)
Subject: Re: [RFC] /dev/ioasid uAPI proposal
To: Liu Yi L <yi.l.liu@linux.intel.com>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <f510f916-e91c-236d-e938-513a5992d3b5@redhat.com>
 <20210531164118.265789ee@yiliu-dev>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78ee2638-1a03-fcc8-50a5-81040f677e69@redhat.com>
Date: Tue, 1 Jun 2021 10:36:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210531164118.265789ee@yiliu-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)\""
 <alex.williamson@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, David Woodhouse <dwmw2@infradead.org>
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

CuWcqCAyMDIxLzUvMzEg5LiL5Y2INDo0MSwgTGl1IFlpIEwg5YaZ6YGTOgo+PiBJIGd1ZXNzIFZG
SU9fQVRUQUNIX0lPQVNJRCB3aWxsIGZhaWwgaWYgdGhlIHVuZGVybGF5ZXIgZG9lc24ndCBzdXBw
b3J0Cj4+IGhhcmR3YXJlIG5lc3RpbmcuIE9yIGlzIHRoZXJlIHdheSB0byBkZXRlY3QgdGhlIGNh
cGFiaWxpdHkgYmVmb3JlPwo+IEkgdGhpbmsgaXQgY291bGQgZmFpbCBpbiB0aGUgSU9BU0lEX0NS
RUFURV9ORVNUSU5HLiBJZiB0aGUgZ3BhX2lvYXNpZAo+IGlzIG5vdCBhYmxlIHRvIHN1cHBvcnQg
bmVzdGluZywgdGhlbiBzaG91bGQgZmFpbCBpdC4KPgo+PiBJIHRoaW5rIEdFVF9JTkZPIG9ubHkg
d29ya3MgYWZ0ZXIgdGhlIEFUVEFDSC4KPiB5ZXMuIEFmdGVyIGF0dGFjaGluZyB0byBncGFfaW9h
c2lkLCB1c2Vyc3BhY2UgY291bGQgR0VUX0lORk8gb24gdGhlCj4gZ3BhX2lvYXNpZCBhbmQgY2hl
Y2sgaWYgbmVzdGluZyBpcyBzdXBwb3J0ZWQgb3Igbm90LiByaWdodD8KCgpTb21lIG1vcmUgcXVl
c3Rpb25zOgoKMSkgSXMgdGhlIGhhbmRsZSByZXR1cm5lZCBieSBJT0FTSURfQUxMT0MgYW4gZmQ/
CjIpIElmIHllcywgd2hhdCdzIHRoZSByZWFzb24gZm9yIG5vdCBzaW1wbHkgdXNlIHRoZSBmZCBv
cGVuZWQgZnJvbSAKL2Rldi9pb2FzLiAoVGhpcyBpcyB0aGUgcXVlc3Rpb24gdGhhdCBpcyBub3Qg
YW5zd2VyZWQpIGFuZCB3aGF0IGhhcHBlbnMgCmlmIHdlIGNhbGwgR0VUX0lORk8gZm9yIHRoZSBp
b2FzaWRfZmQ/CjMpIElmIG5vdCwgaG93IEdFVF9JTkZPIHdvcms/CgoKPgo+Pj4gCS8qIEJpbmQg
Z3Vlc3QgSS9PIHBhZ2UgdGFibGUgICovCj4+PiAJYmluZF9kYXRhID0gewo+Pj4gCQkuaW9hc2lk
CT0gZ2lvdmFfaW9hc2lkOwo+Pj4gCQkuYWRkcgk9IGdpb3ZhX3BndGFibGU7Cj4+PiAJCS8vIGFu
ZCBmb3JtYXQgaW5mb3JtYXRpb24KPj4+IAl9Owo+Pj4gCWlvY3RsKGlvYXNpZF9mZCwgSU9BU0lE
X0JJTkRfUEdUQUJMRSwgJmJpbmRfZGF0YSk7Cj4+Pgo+Pj4gCS8qIEludmFsaWRhdGUgSU9UTEIg
d2hlbiByZXF1aXJlZCAqLwo+Pj4gCWludl9kYXRhID0gewo+Pj4gCQkuaW9hc2lkCT0gZ2lvdmFf
aW9hc2lkOwo+Pj4gCQkvLyBncmFudWxhciBpbmZvcm1hdGlvbgo+Pj4gCX07Cj4+PiAJaW9jdGwo
aW9hc2lkX2ZkLCBJT0FTSURfSU5WQUxJREFURV9DQUNIRSwgJmludl9kYXRhKTsKPj4+Cj4+PiAJ
LyogU2VlIDUuNiBmb3IgSS9PIHBhZ2UgZmF1bHQgaGFuZGxpbmcgKi8KPj4+IAkKPj4+IDUuNS4g
R3Vlc3QgU1ZBICh2U1ZBKQo+Pj4gKysrKysrKysrKysrKysrKysrCj4+Pgo+Pj4gQWZ0ZXIgYm9v
dHMgdGhlIGd1ZXN0IGZ1cnRoZXIgY3JlYXRlIGEgR1ZBIGFkZHJlc3Mgc3BhY2VzIChncGFzaWQx
KSBvbgo+Pj4gZGV2MS4gRGV2MiBpcyBub3QgYWZmZWN0ZWQgKHN0aWxsIGF0dGFjaGVkIHRvIGdp
b3ZhX2lvYXNpZCkuCj4+Pgo+Pj4gQXMgZXhwbGFpbmVkIGluIHNlY3Rpb24gNCwgdXNlciBzaG91
bGQgYXZvaWQgZXhwb3NlIEVOUUNNRCBvbiBib3RoCj4+PiBwZGV2IGFuZCBtZGV2Lgo+Pj4KPj4+
IFRoZSBzZXF1ZW5jZSBhcHBsaWVzIHRvIGFsbCBkZXZpY2UgdHlwZXMgKGJlaW5nIHBkZXYgb3Ig
bWRldiksIGV4Y2VwdAo+Pj4gb25lIGFkZGl0aW9uYWwgc3RlcCB0byBjYWxsIEtWTSBmb3IgRU5R
Q01ELWNhcGFibGUgbWRldjoKPj4gTXkgdW5kZXJzdGFuZGluZyBpcyBFTlFDTUQgaXMgSW50ZWwg
c3BlY2lmaWMgYW5kIG5vdCBhIHJlcXVpcmVtZW50IGZvcgo+PiBoYXZpbmcgdlNWQS4KPiBFTlFD
TUQgaXMgbm90IHJlYWxseSBJbnRlbCBzcGVjaWZpYyBhbHRob3VnaCBvbmx5IEludGVsIHN1cHBv
cnRzIGl0IHRvZGF5Lgo+IFRoZSBQQ0llIERNV3IgY2FwYWJpbGl0eSBpcyB0aGUgY2FwYWJpbGl0
eSBmb3Igc29mdHdhcmUgdG8gZW51bWVyYXRlIHRoZQo+IEVOUUNNRCBzdXBwb3J0IGluIGRldmlj
ZSBzaWRlLiB5ZXMsIGl0IGlzIG5vdCBhIHJlcXVpcmVtZW50IGZvciB2U1ZBLiBUaGV5Cj4gYXJl
IG9ydGhvZ29uYWwuCgoKUmlnaHQsIHRoZW4gaXQncyBiZXR0ZXIgdG8gbWVudGlvbiBETVdyIGlu
c3RlYWQgb2YgYSB2ZW5kb3Igc3BlY2lmaWMgCmluc3RydWN0aW9uIGluIGEgZ2VuZXJhbCBmcmFt
ZXdvcmsgbGlrZSBpb2FzaWQuCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXU=
