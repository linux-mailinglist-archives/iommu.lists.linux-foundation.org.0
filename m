Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8E124E98
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 18:00:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D4ADE20444;
	Wed, 18 Dec 2019 17:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZNmvaHrOb8z; Wed, 18 Dec 2019 17:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE1D820418;
	Wed, 18 Dec 2019 17:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9491C077D;
	Wed, 18 Dec 2019 17:00:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D89C0C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 17:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D4AFB84409
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 17:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0jTbxkKFtMa for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 17:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FA2686975
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576688442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn5SUwiPZ6v5NQ8mtwG6iqV/r/5Gbbs8HrzPzH1EerI=;
 b=ItGxrXOflq3XyLIwUJF7tFGtxNAtXEZvoJAqtOQ8q+t4Z7s9krV+q06Ts5M9DKXW1CBzPU
 agL7aGhiuJwVchL9v7JxPXOgWH5wVBcgrqXkEfqei7IugImk2h4LzKrvvEG+ju9FXxeKXT
 Ncvjlv+uMS2lQ3/c1dvaa/IM9Dcdrpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-9UUkOd8SOmCuHuHDl5aHpg-1; Wed, 18 Dec 2019 12:00:18 -0500
X-MC-Unique: 9UUkOd8SOmCuHuHDl5aHpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 797B119586C8;
 Wed, 18 Dec 2019 17:00:14 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A81460C18;
 Wed, 18 Dec 2019 17:00:09 +0000 (UTC)
Subject: Re: [PATCH v3 08/13] iommu/arm-smmu-v3: Propate ssid_bits
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
 <20191209180514.272727-9-jean-philippe@linaro.org>
 <466bbc57-79d4-274c-67bc-4ed591da9968@redhat.com>
 <20191218160834.GG2371701@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bf66e477-6fea-517e-98b6-123eef625334@redhat.com>
Date: Wed, 18 Dec 2019 18:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191218160834.GG2371701@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, robin.murphy@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, guohanjun@huawei.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 lenb@kernel.org
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

Hi Jean,

On 12/18/19 5:08 PM, Jean-Philippe Brucker wrote:
> On Tue, Dec 17, 2019 at 06:07:26PM +0100, Auger Eric wrote:
>> Hi Jean,
>>
>> On 12/9/19 7:05 PM, Jean-Philippe Brucker wrote:
>>
>> s/Propate/Propagate in the commit title.
>>> Now that we support substream IDs, initialize s1cdmax with the number of
>>> SSID bits supported by a master and the SMMU.
>>>
>>> Context descriptor tables are allocated once for the first master
>>> attached to a domain. Therefore attaching multiple devices with
>>> different SSID sizes is tricky, and we currently don't support it.
>>>
>>> As a future improvement it would be nice to at least support attaching a
>>> SSID-capable device to a domain that isn't using SSID, by reallocating
>>> the SSID table.
>> Isn't that use case relevant (I mean using both devices in a non SSID
>> use case). For platform devices you can work this around with FW but for
>> PCI devices?
> 
> Normally each device gets its own domain. Especially since PASID is a PCI
> Express capability, I expect them to be properly isolated with ACS, each
> with its own IOMMU group. So I don't think this is too relevant for the
> moment, it would be a quirk for a broken system.

OK

Eric
> 
> Thanks,
> Jean
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
