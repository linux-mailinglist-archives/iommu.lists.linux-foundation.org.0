Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A72507C5
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 20:34:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54FD085C62;
	Mon, 24 Aug 2020 18:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE3tsNd48SW9; Mon, 24 Aug 2020 18:34:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3856685B81;
	Mon, 24 Aug 2020 18:34:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 290A7C0051;
	Mon, 24 Aug 2020 18:34:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59EB4C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4847A85B81
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 580DSIPm6oy7 for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 18:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7224B85B4A
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=y5s9jJbL8Rdnw0BzneLpjPMhR5Y8x3gmv/6FKWKQqbA=; b=IfM7a9JVU/JJCyFN+zP5G7WS8O
 v3EwoMXZWsUSzwGrBMwfqMZ0tIY6iS+J/gCfWqjgdWhkOLlMNjD7CiKGrQeNYaFFBS4UQhEGs/aIT
 6f/JYvHURS98AxH8ida6PLrU+rcmQuj4Q04WxtpyMg6S1EsjQPwkBBmYXszvZM15bbEoRtiGKw6i2
 31etz6UIFDsU37Jie0ANCMou5VNPJzn55sElZcljfhftGzpCx3wj62cST8Qutrg+mD4/vPFsQaRKC
 i7od+AVevkO3fO1EXHNWwLiniqwHmbq7NDuQr8S4TBHSxjW9UXrehWRltpA4r76ZpCIuhjf/r91Go
 e7uNpriA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAHIg-00017M-7J; Mon, 24 Aug 2020 18:34:34 +0000
Subject: Re: [PATCH v2 3/9] iommu/ioasid: Introduce ioasid_set APIs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jacob Pan <jacob.pan.linux@gmail.com>
References: <1598070918-21321-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1598070918-21321-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200824182848.GB3210689@myrica>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1be98989-fab3-f9e4-cbd6-cf72a67dc5f1@infradead.org>
Date: Mon, 24 Aug 2020 11:34:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824182848.GB3210689@myrica>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Wu Hao <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On 8/24/20 11:28 AM, Jean-Philippe Brucker wrote:
>> +/**
>> + * struct ioasid_set - Meta data about ioasid_set
>> + * @type:	Token types and other features
> nit: doesn't follow struct order
> 
>> + * @token:	Unique to identify an IOASID set
>> + * @xa:		XArray to store ioasid_set private IDs, can be used for
>> + *		guest-host IOASID mapping, or just a private IOASID namespace.
>> + * @quota:	Max number of IOASIDs can be allocated within the set
>> + * @nr_ioasids	Number of IOASIDs currently allocated in the set

 * @nr_ioasids: Number of IOASIDs currently allocated in the set

>> + * @sid:	ID of the set
>> + * @ref:	Reference count of the users
>> + */
>>  struct ioasid_set {
>> -	int dummy;
>> +	void *token;
>> +	struct xarray xa;
>> +	int type;
>> +	int quota;
>> +	int nr_ioasids;
>> +	int sid;
>> +	refcount_t ref;
>> +	struct rcu_head rcu;
>>  };


-- 
~Randy

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
